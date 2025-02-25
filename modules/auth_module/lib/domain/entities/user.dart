class User {
  final String id;
  final String pin;
  final bool isBiometricConfigured;

  const User({
    required this.id,
    required this.pin,
    required this.isBiometricConfigured,
  });

  User copyWith({String? id, String? pin, bool? isBiometricConfigured}) {
    return User(
      id: id ?? this.id,
      pin: pin ?? this.pin,
      isBiometricConfigured:
          isBiometricConfigured ?? this.isBiometricConfigured,
    );
  }

  static const empty = User(id: "-", pin: "-", isBiometricConfigured: false);
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          pin == other.pin &&
          isBiometricConfigured == other.isBiometricConfigured;

  @override
  int get hashCode =>
      id.hashCode ^ pin.hashCode ^ isBiometricConfigured.hashCode;
}
