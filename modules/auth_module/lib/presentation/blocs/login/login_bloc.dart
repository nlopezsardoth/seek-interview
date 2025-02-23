import 'package:auth_module/data/models/pin.dart';
import 'package:auth_module/domain/usecases/use_cases.dart';
import 'package:auth_module/presentation/blocs/auth/auth_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:router_module/router/config/router_locator.dart';
import 'package:router_module/router/seek_router.dart';
import 'package:shared_module/ui_utils/overlay/error_bottom_sheet_model.dart';
import 'package:shared_module/ui_utils/overlay/loading_status_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>
    with LoadingStatusMixin, ErrorBottomSheetStatusMixin {
  final GetUserUseCase _getUser;
  final ValidatePinUseCase _validatePin;
  final SetNewPinUseCase _setNewPin;
  final BiometricAuthUseCase _biometricAuth;
  final CheckBiometricUseCase _checkBiometric;
  final AuthBloc _authBloc;

  LoginBloc({
    required GetUserUseCase getUser,
    required ValidatePinUseCase validatePin,
    required SetNewPinUseCase setNewPin,
    required BiometricAuthUseCase biometricAuth,
    required CheckBiometricUseCase checkBiometric,
    required AuthBloc authBloc,
  }) : _getUser = getUser,
       _validatePin = validatePin,
       _setNewPin = setNewPin,
       _biometricAuth = biometricAuth,
       _checkBiometric = checkBiometric,
       _authBloc = authBloc,
       super(const LoginState()) {
    loadingStatus.setIsInitialized(true);
    on<LoginCheckStatus>(_onLoginCheckStatus);
    on<LoginWithBiometrics>(_onLoginWithBiometrics);
    on<LoginWithPin>(_onLoginWithPin);
    on<SetupNewPin>(_onSetupNewPin);
    on<PinChanged>(_onPinChanged);
  }

  /// Determines the correct login flow
  Future<void> _onLoginCheckStatus(
    LoginCheckStatus event,
    Emitter<LoginState> emit,
  ) async {
    loadingStatus.begin();
    final recentUserResponse = await _getUser.call(null);
    final bool canUseBiometrics = await _checkBiometrics();
    emit(state.copyWith(canUseBiometrics: canUseBiometrics));
    recentUserResponse.fold(
      (failure) {
        loadingStatus.end();
        emit(state.copyWith(flow: LoginFlow.setNewPin));
      },
      (user) async {
        if (user == null) {
          loadingStatus.end();
          emit(state.copyWith(flow: LoginFlow.setNewPin));
        } else {
          if (canUseBiometrics) {
            loadingStatus.end();
            emit(state.copyWith(flow: LoginFlow.requireBiometric));
          } else {
            loadingStatus.end();
            emit(state.copyWith(flow: LoginFlow.requirePin));
          }
        }
      },
    );
  }

  /// Validate PIN and log in if correct
  void _onPinChanged(PinChanged event, Emitter<LoginState> emit) {
    final pin = Pin.dirty(event.pin);
    emit(
      state.copyWith(
        pin: pin,
        isValid: Formz.validate([pin]),
        errorMessage: null,
      ),
    );
  }

  Future<void> _onLoginWithPin(
    LoginWithPin event,
    Emitter<LoginState> emit,
  ) async {
    if (!state.isValid) return;
    loadingStatus.begin();

    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
        errorMessage: null,
      ),
    );

    final validationResult = await _validatePin(state.pin.value);

    validationResult.fold(
      (failure) {
        loadingStatus.end();
        errorBottomSheetStatus.postSomethingWentWrongError();
      },
      (isPinValid) {
        if (isPinValid) {
          loadingStatus.end();
          _authBloc.add(
            LogInRequested(_authBloc.state.user.copyWith(pin: state.pin.value)),
          );
        } else {
          loadingStatus.end();
          emit(state.copyWith(errorMessage: event.pinNotMatchErrorMessage));
        }
      },
    );
  }

  Future<void> _onSetupNewPin(
    SetupNewPin event,
    Emitter<LoginState> emit,
  ) async {
    if (!state.isValid) return;
    loadingStatus.begin();
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final setNewPinResult = await _setNewPin(state.pin.value);

    setNewPinResult.fold(
      (failure) {
        loadingStatus.end();
        errorBottomSheetStatus.postSomethingWentWrongError();
        return;
      },
      (succes) async {
        if (state.canUseBiometrics) {
          emit(state.copyWith(flow: LoginFlow.requireBiometric));
        } else {
          _authBloc.add(
            LogInRequested(
              _authBloc.state.user.copyWith(
                pin: state.pin.value,
                isBiometricConfigured: false,
              ),
            ),
          );
        }
      },
    );
  }

  Future<void> _onLoginWithBiometrics(
    LoginWithBiometrics event,
    Emitter<LoginState> emit,
  ) async {}

  Future<bool> _checkBiometrics() async {
    bool canAuth = false;
    final canUseBiometricsResponse = await _checkBiometric(null);
    canUseBiometricsResponse.fold(
      (failure) {
        errorBottomSheetStatus.postBiometricSettingsError(() async {
          routerLocator<SeekRouter>().pop();
        });
        canAuth = false;
      },
      (response) async {
        canAuth = response;
      },
    );
    return canAuth;
  }
}
