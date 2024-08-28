import 'package:banking/models/qr_model.dart';
import 'package:flutter/material.dart';

class HistoryQrItemWidget extends StatelessWidget {
  const HistoryQrItemWidget({
    super.key,
    required this.qr,
    required this.onTap,
  });

  final QrModel qr;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          padding: const EdgeInsets.all(8),
          child: Image.network(
            qr.bank.logo ?? '',
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(qr.bank.name ?? ''),
        subtitle: Text(qr.bankNumber),
        onTap: () {
          onTap();
        },
      ),
    );
  }
}
