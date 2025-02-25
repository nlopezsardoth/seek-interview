import 'package:flutter_test/flutter_test.dart';
import 'package:home_module/data/mappers/stored_qr_mapper.dart';
import 'package:home_module/data/models/stored_qr_model.dart';
import 'package:home_module/domain/entities/qr_scann_entity.dart';

void main() {
  group('StoreQrMapper', () {
    final testModel = StoredQr(
      content: 'https://example.com',
      scannedAt: DateTime(2025, 02, 23),
    );

    final testEntity = QrScan(
      data: 'https://example.com',
      scannedAt: DateTime(2025, 02, 23),
    );

    final testModelList = [testModel, StoredQr(
      content: 'https://another.com',
      scannedAt: DateTime(2025, 02, 23),
    )];
    final testEntityList = [testEntity, testEntity.copyWith(data: 'https://another.com')];

    test('should convert StoredQr model to QrScan entity correctly', () {
      final result = StoreQrMapper.fromModel(testModel);

      expect(result, isA<QrScan>());
      expect(result.data, testEntity.data);
      expect(result.scannedAt.day, testEntity.scannedAt.day);
    });

    test('should convert QrScan entity to StoredQr model correctly', () {
      final result = StoreQrMapper.toModel(testEntity);

      expect(result, isA<StoredQr>());
      expect(result.content, testModel.content);
      expect(result.scannedAt.day, testModel.scannedAt.day);
    });

    test('should convert List<StoredQr> to List<QrScan> correctly', () {
      final result = StoreQrMapper.fromModelList(testModelList);

      expect(result, isA<List<QrScan>>());
      expect(result.length, testModelList.length);
      expect(result[0].data, testModelList[0].content);
      expect(result[1].data, testModelList[1].content);
    });

    test('should convert List<QrScan> to List<StoredQr> correctly', () {
      final result = StoreQrMapper.toModelList(testEntityList);

      expect(result, isA<List<StoredQr>>());
      expect(result.length, testEntityList.length);
      expect(result[0].content, testEntityList[0].data);
      expect(result[1].content, testEntityList[1].data);
    });
  });
}
