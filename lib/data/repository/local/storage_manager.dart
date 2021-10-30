import 'package:weatherforecast/data/model/internal/unit.dart';
import 'package:weatherforecast/data/repository/local/storage_provider.dart';
import 'package:weatherforecast/resources/config/ids.dart';
import 'package:weatherforecast/utils/app_logger.dart';

class StorageManager {
  final StorageProvider _storageProvider;

  StorageManager(this._storageProvider);

  Future<Unit> getUnit() async {
    try {
      final int? unit = await _storageProvider.getInt(Ids.storageUnitKey);
      if (unit == null) {
        return Unit.metric;
      } else {
        if (unit == 0) {
          return Unit.metric;
        } else {
          return Unit.imperial;
        }
      }
    } catch (exc, stackTrace) {
      Log.e("Exception: $exc stack trace: $stackTrace");
      return Unit.metric;
    }
  }

  Future<bool> saveUnit(Unit unit) async {
    try {
      Log.d("Store unit $unit");
      int unitValue = 0;
      if (unit == Unit.metric) {
        unitValue = 0;
      } else {
        unitValue = 1;
      }

      final result =
          await _storageProvider.setInt(Ids.storageUnitKey, unitValue);
      Log.d("Saved with result: $result");

      return result;
    } catch (exc, stackTrace) {
      Log.e("Exception: $exc stack trace: $stackTrace");
      return false;
    }
  }
}
