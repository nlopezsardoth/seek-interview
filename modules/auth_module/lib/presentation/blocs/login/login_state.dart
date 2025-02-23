part of 'login_bloc.dart';

enum LoginFlow {
  initial,
  setNewPin,
  requireBiometric,
  requirePin,
}

final class LoginState extends Equatable {
  const LoginState({
    this.flow = LoginFlow.initial,
    this.canUseBiometrics = false,
    this.status = FormzSubmissionStatus.initial,
    this.pin = const Pin.pure(),
    this.isValid = false,
    this.errorMessage = "",
  });

  final LoginFlow flow;
  final bool canUseBiometrics;
  final FormzSubmissionStatus status;
  final Pin pin;
  final bool isValid;
  final String errorMessage;

  LoginState copyWith({
    LoginFlow? flow,
    bool? canUseBiometrics,
    FormzSubmissionStatus? status,
    Pin? pin,
    bool? isValid,
    String? errorMessage,
  }) {
    return LoginState(
      flow: flow ?? this.flow,
      canUseBiometrics:
          canUseBiometrics ?? this.canUseBiometrics,
      status: status ?? this.status,
      pin: pin ?? this.pin,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
    flow,
    canUseBiometrics,
    status,
    pin,
    isValid,
    errorMessage,
  ];
}
