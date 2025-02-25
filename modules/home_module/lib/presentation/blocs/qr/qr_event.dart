part of 'qr_bloc.dart';

abstract class QrEvent extends Equatable {
  const QrEvent();

  @override
  List<Object> get props => [];
}

class ScanQrCode extends QrEvent {}

class LoadQrHistory extends QrEvent {}

class ClearQrHistory extends QrEvent {}
