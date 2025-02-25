import 'package:auth_module/l10n/auth_localizations.dart';
import 'package:auth_module/presentation/blocs/auth/auth_bloc.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  AuthLocalizations,
  AuthBloc,
])
class PresentationMockHelper {}