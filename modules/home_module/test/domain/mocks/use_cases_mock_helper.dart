import 'package:home_module/domain/use_cases/usecases.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  ClearQrHistoryUseCase,
  GetQrHistoryUseCase,
  SaveQrHistoryUseCase,
  ScanQrUseCase,
])
class UseCasesMockHelper {}