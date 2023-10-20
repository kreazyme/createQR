import 'package:flutter/material.dart';

class ShowQRScreen extends StatelessWidget {
  const ShowQRScreen({
    super.key,
    required this.qrCode,
  });

  final String qrCode;

  @override
  Widget build(BuildContext context) {
    print(qrCode);
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code"),
      ),
      body: Center(
        child: Image.network(qrCode),
      ),
    );
  }
}
