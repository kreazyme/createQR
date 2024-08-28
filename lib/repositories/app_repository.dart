import 'package:banking/models/qr_model.dart';
import 'package:banking/services/local_storage_service.dart';
import 'package:isar/isar.dart';

class AppRepository {
  // singleton
  static final AppRepository instance = AppRepository._internal();
  factory AppRepository() => instance;
  AppRepository._internal();

  final LocalStorageService _localStorageService = LocalStorageService.instance;

  Future<void> initAppRepo() async {
    await _localStorageService.initLocalStorage();
  }

  void saveQr(QrModel qrModel) {
    _localStorageService.db.write((isar) {
      isar.qrModels.put(qrModel);
    });
  }

  List<QrModel> getQrs() => _localStorageService.db.qrModels.where().sortByCreatedAt().findAll();
}
