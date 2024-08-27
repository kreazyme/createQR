import 'package:banking/pages/show_qr/show_qr_background_wiget.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class ItemQRCode extends StatelessWidget {
  const ItemQRCode({
    super.key,
    required this.qrSize,
    required this.data,
    required Color selectedColor,
  }) : _selectedColor = selectedColor;

  final double qrSize;
  final String data;
  final Color _selectedColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          const ShowQrBackgroundWidget(
            icons: ['🤲', '👏', '🙌'],
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(32),
              margin: const EdgeInsets.all(52),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 8,
                      blurRadius: 12,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: qrSize,
                    height: qrSize,
                    child: PrettyQrView.data(
                      data: data,
                      decoration: PrettyQrDecoration(
                        background: Colors.white,
                        shape: PrettyQrSmoothSymbol(
                          color: _selectedColor,
                        ),
                        // image: const PrettyQrDecorationImage(
                        //   scale: 0.3,
                        //   padding: EdgeInsets.all(12),
                        //   image: AssetImage(
                        //     'assets/images/PXU.png',
                        //   ),
                        // ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "@Quick.QRBank",
                    style: TextStyle(
                      fontSize: 24,
                      color: _selectedColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
