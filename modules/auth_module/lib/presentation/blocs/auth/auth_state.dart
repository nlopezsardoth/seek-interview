part of 'auth_bloc.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthState extends Equatable {
  const AuthState({
    this.status = AuthStatus.unknown,
    this.user = User.empty,
  });

  const AuthState.unknown() : this();

  const AuthState.authenticated(User user)
      : this(status: AuthStatus.authenticated, user: user);

  const AuthState.unauthenticated(User? user)
      : this(status: AuthStatus.unauthenticated, user: user ?? User.empty);

  final AuthStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}

