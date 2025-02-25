import 'package:home_module/domain/use_cases/usecases.dart';
import 'package:home_module/presentation/blocs/qr/qr_bloc.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  ScanQrUseCase,
  GetQrHistoryUseCase,
  SaveQrHistoryUseCase,
  ClearQrHistoryUseCase,
  QrBloc,
])
class PresentationMockHelper {}
