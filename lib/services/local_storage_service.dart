import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  // singleton
  static final LocalStorageService instance = LocalStorageService._internal();
  factory LocalStorageService() => instance;
  LocalStorageService._internal();

  late SharedPreferencesAsync db;

  // init local storage
  Future<void> initLocalStorage() async {
    db = SharedPreferencesAsync();
  }
}
