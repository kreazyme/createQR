import 'dart:convert';

import 'package:banking/models/qr_model.dart';
import 'package:banking/services/local_storage_service.dart';
import 'package:flutter/foundation.dart';

class AppRepository {
  // singleton
  static final AppRepository instance = AppRepository._internal();
  factory AppRepository() => instance;
  AppRepository._internal();

  final LocalStorageService _localStorageService = LocalStorageService.instance;

  Future<void> initAppRepo() async {
    await _localStorageService.initLocalStorage();
  }

  // shared preferences
  Future<void> saveQr(QrModel qrModel) async {
    final qrJson = await compute(_encodeQrToJson, qrModel);
    await _localStorageService.db.setString('qr_history_${qrModel.id}', qrJson);
  }

  Future<List<QrModel>> getQrs() async {
    final keys = await _localStorageService.db.getKeys();
    final qrKeys = keys.where((key) => key.contains('qr_history_')).toList();
    final qrJsons = await Future.wait(qrKeys.map((key) => _localStorageService.db.getString(key)));
    qrJsons.removeWhere((element) => element == null);
    final qrs = await compute(_decodeQrFromJsonList, qrJsons.cast<String>());
    qrs.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return qrs;
  }

  String _encodeQrToJson(QrModel qrModel) {
    return jsonEncode(qrModel.toJson());
  }

  List<QrModel> _decodeQrFromJsonList(List<String> qrJsons) {
    return qrJsons.map((qrJson) => QrModel.fromJson(jsonDecode(qrJson))).toList();
  }
}
