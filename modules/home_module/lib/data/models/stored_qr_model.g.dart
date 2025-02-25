// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stored_qr_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoredQr _$StoredQrFromJson(Map<String, dynamic> json) => StoredQr(
      content: json['content'] as String,
      scannedAt: DateTime.parse(json['scannedAt'] as String),
    );

Map<String, dynamic> _$StoredQrToJson(StoredQr instance) => <String, dynamic>{
      'content': instance.content,
      'scannedAt': instance.scannedAt.toIso8601String(),
    };
