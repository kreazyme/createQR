import 'package:banking/models/qr_model.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorageService {
  // singleton
  static final LocalStorageService instance = LocalStorageService._internal();
  factory LocalStorageService() => instance;
  LocalStorageService._internal();

  late Isar db;
  // init isar
  Future<void> initLocalStorage() async {
    if (kIsWeb) {
      // For web, make sure to initalize before
      await Isar.initialize();

      // Use sync methods
      db = Isar.open(
        schemas: [QrModelSchema],
        directory: Isar.sqliteInMemory,
        engine: IsarEngine.sqlite,
      );
    } else {
      final dir = await getApplicationDocumentsDirectory();
      db = await Isar.openAsync(
        schemas: [QrModelSchema],
        directory: dir.path,
      );
    }
  }
}
