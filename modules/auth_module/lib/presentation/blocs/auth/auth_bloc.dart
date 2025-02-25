import 'dart:async';
import 'package:auth_module/domain/entities/user.dart';
import 'package:auth_module/domain/usecases/use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_module/ui_utils/overlay/error_bottom_sheet_model.dart';
import 'package:shared_module/ui_utils/overlay/loading_status_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>
    with LoadingStatusMixin, ErrorBottomSheetStatusMixin {
  final LogInUseCase _loginUser;

  AuthBloc({required LogInUseCase loginUser})
    : _loginUser = loginUser,
      super(const AuthState.unknown()) {
    loadingStatus.setIsInitialized(true);
    on<LogInRequested>(_onLogInRequested);
    on<UpdateUserState>(_onUpdateUserState);
  }


  Future<void> _onLogInRequested(
    LogInRequested event,
    Emitter<AuthState> emit,
  ) async {
    loadingStatus.begin();
    final logInResponse = await _loginUser.call(event.user);
    logInResponse.fold(
      (failure) {
        loadingStatus.end();
        emit(AuthState.unauthenticated(event.user));
        errorBottomSheetStatus.postSomethingWentWrongError();
      },
      (success) {
        loadingStatus.end();
        emit(AuthState.authenticated(event.user));
      },
    );
  }

  FutureOr<void> _onUpdateUserState(UpdateUserState event, Emitter<AuthState> emit) {
    emit(AuthState.unauthenticated(event.user));
  }
}
