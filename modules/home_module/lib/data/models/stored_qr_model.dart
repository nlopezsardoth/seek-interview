import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stored_qr_model.g.dart';

@JsonSerializable()
class StoredQr extends Equatable{
  final String content;
  final DateTime scannedAt;

  const StoredQr({required this.content, required this.scannedAt});

  factory StoredQr.fromJson(Map<String, dynamic> json) => _$StoredQrFromJson(json);
  Map<String, dynamic> toJson() => _$StoredQrToJson(this);

  @override
  List<Object?> get props => [content, scannedAt.toLocal().toIso8601String().split('T').first];
}
