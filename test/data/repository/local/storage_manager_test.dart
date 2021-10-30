import 'package:flutter_test/flutter_test.dart';
import 'package:weatherforecast/data/model/internal/unit.dart';
import 'package:weatherforecast/data/repository/local/storage_manager.dart';

import 'fake_storage_provider.dart';

void main() {
  late StorageManager _storageManager;
  setUpAll(() {
    _storageManager = StorageManager(FakeStorageProvider());
  });

  group("Unit", () {
    test("getUnit returns default unit", () async {
      expect(await _storageManager.getUnit(), Unit.metric);
    });

    test("getUnit returns saved Unit", () async {
      _storageManager.saveUnit(Unit.imperial);
      expect(await _storageManager.getUnit(), Unit.imperial);

      _storageManager.saveUnit(Unit.metric);
      expect(await _storageManager.getUnit(), Unit.metric);
    });

    test("saveUnit returns true", () async {
      expect(await _storageManager.saveUnit(Unit.imperial), true);
      expect(await _storageManager.saveUnit(Unit.metric), true);
    });
  });
}
