class LocalDatabaseException implements Exception {
  const LocalDatabaseException({required this.message});

  final String message;

  @override
  String toString() {
    return 'LocalDatabaseException{message: $message}';
  }
}

class BiometricAuthException implements Exception {
  const BiometricAuthException({required this.message});

  final String message;

  @override
  String toString() {
    return 'BiometricAuthException{message: $message}';
  }
}
class QrScanException implements Exception {
  const QrScanException({required this.message});

  final String message;

  @override
  String toString() {
    return 'QrScanException{message: $message}';
  }
}
class QrHistoryException implements Exception {
  const QrHistoryException({required this.message});

  final String message;

  @override
  String toString() {
    return 'QrScanException{message: $message}';
  }
}