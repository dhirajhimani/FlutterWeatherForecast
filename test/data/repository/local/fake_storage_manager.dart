import 'package:weatherforecast/data/model/internal/unit.dart';
import 'package:weatherforecast/data/repository/local/storage_manager.dart';

import 'fake_storage_provider.dart';

///Fake class which mocks StorageManager
class FakeStorageManager extends StorageManager {
  Unit _unit = Unit.imperial;

  FakeStorageManager() : super(FakeStorageProvider());

  @override
  Future<Unit> getUnit() async {
    return _unit;
  }

  @override
  Future<bool> saveUnit(Unit unit) async {
    _unit = unit;
    return true;
  }
}
