part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LogInRequested extends AuthEvent {
  final User user;

  LogInRequested(this.user);

  @override
  List<Object> get props => [user];
}

class UpdateUserState extends AuthEvent {
  final User user;

  UpdateUserState(this.user);

  @override
  List<Object> get props => [user];
}