class User {
  final String id;
  final String pin;
  final bool isBiometricConfigured;
  final String biometricID;

  const User({
    required this.id,
    required this.pin,
    required this.isBiometricConfigured,
    required this.biometricID,
  });

  User copyWith({
    String? id,
    String? pin,
    bool? isBiometricConfigured,
    String? biometricID,
  }) {
    return User(
      id: id ?? this.id,
      pin: pin ?? this.pin,
      isBiometricConfigured: isBiometricConfigured ?? this.isBiometricConfigured,
      biometricID: biometricID ?? this.biometricID,
    );
  }

  static const empty = User(id: "-", pin: "-", isBiometricConfigured: false, biometricID: "-");
}