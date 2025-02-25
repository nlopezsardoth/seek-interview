import 'package:equatable/equatable.dart';

class QrScan extends Equatable {
  final String data;
  final DateTime scannedAt;

  const QrScan({
    required this.data,
    required this.scannedAt,
  });

  QrScan copyWith({String? data, DateTime? scannedAt}) {
    return QrScan(
      data: data ?? this.data,
      scannedAt: scannedAt ?? this.scannedAt,
    );
  }
  
  @override
  List<Object?> get props => [data, scannedAt.toLocal().toIso8601String().split('T').first];
}
