part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

/// Check if user has a PIN or biometric login enabled
class LoginCheckStatus extends LoginEvent {}

/// Attempt biometric login
class LoginWithBiometrics extends LoginEvent {
  final BiometricAuthParams biometricParameters;

  const LoginWithBiometrics(this.biometricParameters);

  @override
  List<Object> get props => [biometricParameters];
}

/// Attempt PIN login
class LoginWithPin extends LoginEvent {
  const LoginWithPin(this.pinNotMatchErrorMessage);
  
  final String pinNotMatchErrorMessage;

  @override
  List<Object> get props => [pinNotMatchErrorMessage];
}

/// Strat login with PIN flow
class GoToLoginWithPin extends LoginEvent {}

/// Set up a new PIN
class SetupNewPin extends LoginEvent {}

final class PinChanged extends LoginEvent {
  const PinChanged(this.pin);

  final String pin;

  @override
  List<Object> get props => [pin];
}
