import 'dart:convert';

import 'package:auth_module/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_module/data/mappers/stored_qr_mapper.dart';
import 'package:home_module/data/models/stored_qr_model.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_module/errors/exceptions.dart';
import 'package:shared_module/features/storage/data/datasources/seek_storage_datasource_impl.dart';

import '../mocks/datasources_mock_helper.mocks.dart';

void main() {
  late SeekStorageDatasourceImpl datasource;
  late MockSeekStorage mockStorage;

  setUp(() {
    mockStorage = MockSeekStorage();
    datasource = SeekStorageDatasourceImpl(storage: mockStorage);
  });

  final testQrScan = StoredQr(content: 'https://example.com', scannedAt: DateTime.now());
  final testQrScanList = [testQrScan];
  final testQrScanListJson = jsonEncode(
    testQrScanList.map((e) => e.toJson()).toList(),
  );

  group('getUser', () {
    test(
      'GIVEN stored user data WHEN calling getUser THEN should return a UserModel',
      () async {
        final userModel = UserModel(id: '123', pin: '1234');
        final jsonString = jsonEncode(userModel.toJson());

        when(mockStorage.read(key: 'user')).thenAnswer((_) async => jsonString);

        final result = await datasource.getUser();

        expect(result, equals(userModel));
        verify(mockStorage.read(key: 'user')).called(1);
        verifyNoMoreInteractions(mockStorage);
      },
    );

    test(
      'GIVEN no stored user data WHEN calling getUser THEN should return null',
      () async {
        when(mockStorage.read(key: 'user')).thenAnswer((_) async => null);

        final result = await datasource.getUser();

        expect(result, isNull);
        verify(mockStorage.read(key: 'user')).called(1);
        verifyNoMoreInteractions(mockStorage);
      },
    );

    test(
      'GIVEN storage exception WHEN calling getUser THEN should throw LocalDatabaseException',
      () async {
        when(
          mockStorage.read(key: 'user'),
        ).thenThrow(Exception('Storage error'));

        expect(
          () async => await datasource.getUser(),
          throwsA(isA<LocalDatabaseException>()),
        );
        verify(mockStorage.read(key: 'user')).called(1);
        verifyNoMoreInteractions(mockStorage);
      },
    );
  });

  group('putUser', () {
    test(
      'GIVEN a valid UserModel WHEN calling putUser THEN should store the user and return true',
      () async {
        final userModel = UserModel(id: '123', pin: '1234');
        final jsonString = jsonEncode(userModel.toJson());

        when(
          mockStorage.write(key: 'user', value: jsonString),
        ).thenAnswer((_) async {});

        final result = await datasource.putUser(recentUserLocal: userModel);

        expect(result, isTrue);
        verify(mockStorage.write(key: 'user', value: jsonString)).called(1);
        verifyNoMoreInteractions(mockStorage);
      },
    );

    test(
      'GIVEN storage exception WHEN calling putUser THEN should throw LocalDatabaseException',
      () async {
        final userModel = UserModel(id: '123', pin: '1234');
        final jsonString = jsonEncode(userModel.toJson());

        when(
          mockStorage.write(key: 'user', value: jsonString),
        ).thenThrow(Exception('Storage error'));

        expect(
          () async => await datasource.putUser(recentUserLocal: userModel),
          throwsA(isA<LocalDatabaseException>()),
        );
        verify(mockStorage.write(key: 'user', value: jsonString)).called(1);
        verifyNoMoreInteractions(mockStorage);
      },
    );
  });
  group('getQrScanHistory', () {
    test(
      'GIVEN stored scan history WHEN calling getQrScanHistory THEN should return list of QrScanResult',
      () async {
        when(
          mockStorage.read(key: 'qr_scan_history'),
        ).thenAnswer((_) async => testQrScanListJson);

        final result = await datasource.getQrScanHistory();

        expect(
          result.map((e) => e.toJson()).toList(),
          equals(testQrScanList.map((e) => e.toJson()).toList()),
        );

        verify(mockStorage.read(key: 'qr_scan_history')).called(1);
      },
    );

    test(
      'GIVEN no stored scan history WHEN calling getQrScanHistory THEN should return empty list',
      () async {
        when(
          mockStorage.read(key: 'qr_scan_history'),
        ).thenAnswer((_) async => null);

        final result = await datasource.getQrScanHistory();

        expect(result, isEmpty);
        verify(mockStorage.read(key: 'qr_scan_history')).called(1);
        verifyNoMoreInteractions(mockStorage);
      },
    );

    test(
      'GIVEN storage exception WHEN calling getQrScanHistory THEN should throw LocalDatabaseException',
      () async {
        when(
          mockStorage.read(key: 'qr_scan_history'),
        ).thenThrow(Exception('Storage error'));

        expect(
          () async => await datasource.getQrScanHistory(),
          throwsA(isA<LocalDatabaseException>()),
        );
        verify(mockStorage.read(key: 'qr_scan_history')).called(1);
        verifyNoMoreInteractions(mockStorage);
      },
    );
  });

  group('saveQrScan', () {
    test(
      'GIVEN a new scan WHEN calling saveQrScan THEN should store it in history',
      () async {
        when(
          mockStorage.read(key: 'qr_scan_history'),
        ).thenAnswer((_) async => null);
        when(
          mockStorage.write(key: 'qr_scan_history', value: testQrScanListJson),
        ).thenAnswer((_) async {});

        await datasource.saveQrScan(StoreQrMapper.fromModel(testQrScan));

        verify(mockStorage.read(key: 'qr_scan_history')).called(1);
        verify(
          mockStorage.write(key: 'qr_scan_history', value: testQrScanListJson),
        ).called(1);
        verifyNoMoreInteractions(mockStorage);
      },
    );

    test(
      'GIVEN existing scan history WHEN calling saveQrScan THEN should append new scan',
      () async {
        final newScan = StoredQr(content: 'https://another-example.com', scannedAt: DateTime.now());
        final updatedList = [...testQrScanList, newScan];
        final updatedListJson = jsonEncode(
          updatedList.map((e) => e.toJson()).toList(),
        );

        when(
          mockStorage.read(key: 'qr_scan_history'),
        ).thenAnswer((_) async => testQrScanListJson);
        when(
          mockStorage.write(key: 'qr_scan_history', value: updatedListJson),
        ).thenAnswer((_) async {});

        await datasource.saveQrScan(StoreQrMapper.fromModel(newScan));

        verify(mockStorage.read(key: 'qr_scan_history')).called(1);
        verify(
          mockStorage.write(key: 'qr_scan_history', value: updatedListJson),
        ).called(1);
        verifyNoMoreInteractions(mockStorage);
      },
    );

    test(
      'GIVEN storage exception WHEN calling saveQrScan THEN should throw LocalDatabaseException',
      () async {
        when(
          mockStorage.read(key: 'qr_scan_history'),
        ).thenThrow(Exception('Storage error'));

        expect(
          () async => await datasource.saveQrScan(StoreQrMapper.fromModel(testQrScan)),
          throwsA(isA<LocalDatabaseException>()),
        );
        verify(mockStorage.read(key: 'qr_scan_history')).called(1);
        verifyNoMoreInteractions(mockStorage);
      },
    );
  });

  group('clearQrHistory', () {
    test(
      'GIVEN history exists WHEN calling clearQrHistory THEN should delete history',
      () async {
        when(
          mockStorage.delete(key: 'qr_scan_history'),
        ).thenAnswer((_) async {});

        await datasource.clearQrHistory();

        verify(mockStorage.delete(key: 'qr_scan_history')).called(1);
        verifyNoMoreInteractions(mockStorage);
      },
    );

    test(
      'GIVEN storage exception WHEN calling clearQrHistory THEN should throw LocalDatabaseException',
      () async {
        when(
          mockStorage.delete(key: 'qr_scan_history'),
        ).thenThrow(Exception('Storage error'));

        expect(
          () async => await datasource.clearQrHistory(),
          throwsA(isA<LocalDatabaseException>()),
        );
        verify(mockStorage.delete(key: 'qr_scan_history')).called(1);
        verifyNoMoreInteractions(mockStorage);
      },
    );
  });
}
