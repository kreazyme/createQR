import 'package:banking/models/bank_model.dart';

class QrModel {
  String id;
  String qrCode;
  BankModel bank;
  String bankNumber;
  int colorIndex;
  DateTime createdAt;

  QrModel({
    required this.id,
    required this.qrCode,
    required this.bank,
    required this.bankNumber,
    required this.colorIndex,
    required this.createdAt,
  });

  QrModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        qrCode = json['qrCode'],
        bank = BankModel.fromJson(json['bank']),
        bankNumber = json['bankNumber'],
        colorIndex = json['colorIndex'],
        createdAt = DateTime.parse(json['createdAt']);

  // uuid
  Map<String, dynamic> toJson() => {
        'id': id,
        'qrCode': qrCode,
        'bank': bank.toJson(),
        'bankNumber': bankNumber,
        'colorIndex': colorIndex,
        'createdAt': createdAt.toIso8601String(),
      };
}
