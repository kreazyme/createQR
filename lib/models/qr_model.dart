import 'package:banking/models/bank_model.dart';
import 'package:isar/isar.dart';

part 'qr_model.g.dart';

@collection
class QrModel {
  late int id;
  late final String qrCode;
  late final BankModel bank;
  late final String bankNumber;
  late final DateTime createdAt = DateTime.now();
}
