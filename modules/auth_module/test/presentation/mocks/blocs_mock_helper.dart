import 'package:auth_module/presentation/blocs/auth/auth_bloc.dart';
import 'package:auth_module/presentation/blocs/login/login_bloc.dart';
import 'package:mockito/annotations.dart';



@GenerateMocks([AuthBloc, LoginBloc])
class MockBloc {}