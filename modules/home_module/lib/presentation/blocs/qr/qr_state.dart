part of 'qr_bloc.dart';

class QrState extends Equatable{
  const QrState({
    this.qrScan,
    this.history = const [],
    this.errorMessage,
  });

  final QrScan? qrScan;
  final List<QrScan> history;
  final String? errorMessage;

  QrState copyWith({
    QrScan? qrScan,
    List<QrScan>? history,
    String? errorMessage,
    bool resetError = false,
  }) {
    return QrState(
      qrScan: qrScan ?? this.qrScan,
      history: history ?? this.history,
      errorMessage: resetError ? null : errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [qrScan, history, errorMessage];
}
