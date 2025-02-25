import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:home_module/domain/entities/qr_scann_entity.dart';
import 'package:home_module/domain/use_cases/usecases.dart';
import 'package:router_module/router/config/router_locator.dart';
import 'package:router_module/router/seek_router.dart';
import 'package:shared_module/entities/no_parameters.dart';
import 'package:shared_module/ui_utils/overlay/error_bottom_sheet_model.dart';
import 'package:shared_module/ui_utils/overlay/loading_status_model.dart';

part 'qr_event.dart';
part 'qr_state.dart';

class QrBloc extends Bloc<QrEvent, QrState>
    with LoadingStatusMixin, ErrorBottomSheetStatusMixin {
  final ScanQrUseCase _scanQrUseCase;
  final GetQrHistoryUseCase _getQrHistoryUseCase;
  final SaveQrHistoryUseCase _saveQrHistoryUseCase;
  final ClearQrHistoryUseCase _clearQrHistoryUseCase;

  QrBloc({
    required ScanQrUseCase scanQrUseCase,
    required GetQrHistoryUseCase getQrHistoryUseCase,
    required SaveQrHistoryUseCase saveQrHistoryUseCase,
    required ClearQrHistoryUseCase clearQrHistoryUseCase,
  }) : _scanQrUseCase = scanQrUseCase,
       _getQrHistoryUseCase = getQrHistoryUseCase,
       _saveQrHistoryUseCase = saveQrHistoryUseCase,
       _clearQrHistoryUseCase = clearQrHistoryUseCase,

       super(const QrState()) {
    loadingStatus.setIsInitialized(true);
    on<ScanQrCode>(_scanQrCode);
    on<LoadQrHistory>(_loadQrHistory);
    on<ClearQrHistory>(_clearQrHistory);
  }

  Future<void> _scanQrCode(ScanQrCode event, Emitter<QrState> emit) async {
    loadingStatus.begin();
    final result = await _scanQrUseCase(NoParams());
    await result.fold(
      (failure) async {
        loadingStatus.end();
        errorBottomSheetStatus.postSomethingWentWrongError();
      },
      (qrScan) async {
        loadingStatus.end();
        await _saveQrHistoryUseCase(qrScan);
        emit(state.copyWith(qrScan: qrScan));
        add(LoadQrHistory());
      },
    );
  }

  Future<void> _loadQrHistory(
    LoadQrHistory event,
    Emitter<QrState> emit,
  ) async {
    loadingStatus.begin();
    final result = await _getQrHistoryUseCase(NoParams());
    result.fold(
      (failure) => errorBottomSheetStatus.postQrScannError(() {
        routerLocator<SeekRouter>().pop();
      }),
      (history) => emit(state.copyWith(history: history)),
    );
    loadingStatus.end();
  }

  Future<void> _clearQrHistory(
    ClearQrHistory event,
    Emitter<QrState> emit,
  ) async {
    loadingStatus.begin();
    final result = await _clearQrHistoryUseCase(NoParams());
    result.fold(
      (failure) => errorBottomSheetStatus.postSomethingWentWrongError(),
      (_) => emit(state.copyWith(history: [])),
    );
    loadingStatus.end();
  }
}
