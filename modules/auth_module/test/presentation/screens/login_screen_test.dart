import 'package:auth_module/domain/entities/user.dart';
import 'package:auth_module/presentation/blocs/auth/auth_bloc.dart';
import 'package:auth_module/presentation/blocs/login/login_bloc.dart';
import 'package:auth_module/presentation/views/views.dart';
import 'package:auth_module/presentation/screens/login_screen.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:router_module/config/router_locator.dart';
import 'package:router_module/router/routes/home_router.dart';
import 'package:router_module/router/seek_router.dart';
import 'package:shared_module/widgets/seek_loader.dart';

import '../mocks/blocs_mock_helper.mocks.dart';

void main() {
  late MockAuthBloc mockAuthBloc;
  late MockLoginBloc mockLoginBloc;

  setUp(() {
    mockAuthBloc = MockAuthBloc();
    mockLoginBloc = MockLoginBloc();

    whenListen(
      mockAuthBloc,
      Stream<AuthState>.fromIterable([AuthState.authenticated(User.empty)]),
      initialState: AuthState.authenticated(User.empty),
    );
  });

  Widget createTestableWidget() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>.value(value: mockAuthBloc),
        BlocProvider<LoginBloc>.value(value: mockLoginBloc),
      ],
      child: const MaterialApp(home: LoginScreen()),
    );
  }

  testWidgets('Navigates to home screen when authenticated', (tester) async {
    whenListen(
      mockAuthBloc,
      Stream<AuthState>.fromIterable([AuthState.authenticated(User.empty)]),
      initialState: AuthState.authenticated(User.empty),
    );
    await tester.pumpWidget(createTestableWidget());
    await tester.pumpAndSettle();

    verify(() => routerLocator<SeekRouter>().go(homeRoute)).called(1);
  });

  testWidgets('Displays PinAuthView when flow is setNewPin', (tester) async {
    // when(() => mockLoginBloc.state).thenReturn(
    //   const LoginState(flow: LoginFlow.setNewPin),
    // );

    await tester.pumpWidget(createTestableWidget());
    await tester.pump();

    expect(find.byType(PinAuthView), findsOneWidget);
  });

  testWidgets('Displays BiometricAuthView when flow is requireBiometric', (
    tester,
  ) async {
    // when(() => mockLoginBloc.state).thenReturn(
    //   const LoginState(flow: LoginFlow.requireBiometric),
    // );

    await tester.pumpWidget(createTestableWidget());
    await tester.pump();

    expect(find.byType(BiometricAuthView), findsOneWidget);
  });

  testWidgets('Displays SeekLoader by default', (tester) async {
    // when(() => mockLoginBloc.state).thenReturn(const LoginState(flow: LoginFlow.initial));

    await tester.pumpWidget(createTestableWidget());
    await tester.pump();

    expect(find.byType(SeekLoader), findsOneWidget);
  });
}
