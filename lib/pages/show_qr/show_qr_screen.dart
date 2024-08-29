import 'dart:developer';
import 'dart:typed_data';

import 'package:banking/data/colors.dart';
import 'package:banking/models/qr_model.dart';
import 'package:banking/pages/show_qr/item_qr_code_widget.dart';
import 'package:banking/repositories/app_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:zxing2/qrcode.dart';

class ShowQRScreen extends StatefulWidget {
  const ShowQRScreen(
    this.qr, {
    super.key,
    this.isSaved = false,
  });

  final QrModel qr;
  final bool isSaved;

  @override
  State<ShowQRScreen> createState() => _ShowQRScreenState();
}

class _ShowQRScreenState extends State<ShowQRScreen> {
  Uint8List? qrImage;
  String data = '';
  bool _isLoading = true;
  int _selectedColorIndex = 0;

  List<Color> get colors => AppColors.colors;
  Color get _selectedColor => colors[_selectedColorIndex];

  Future<void> _downloadQRImage() async {
    try {
      final response = await Dio().get(
        widget.qr.qrCode,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) => (status ?? 400) < 500,
        ),
      );

      final image = img.decodePng(response.data)!;
      final source = RGBLuminanceSource(
        image.width,
        image.height,
        image
            .convert(numChannels: 4)
            .getBytes(order: img.ChannelOrder.abgr)
            .buffer
            .asInt32List(),
      );
      final bitmap = BinaryBitmap(GlobalHistogramBinarizer(source));
      final reader = QRCodeReader();
      final result = reader.decode(bitmap);

      setState(() {
        data = result.text;
        qrImage = response.data;
        _isLoading = false;
      });
    } catch (e) {
      log(e.toString());
    }
  }

  void _setSelectedColor() {
    setState(() {
      _selectedColorIndex = widget.qr.colorIndex;
    });
  }

  @override
  void initState() {
    super.initState();
    _downloadQRImage();
    _setSelectedColor();
  }

  void _saveQr() async {
    try {
      widget.qr.colorIndex = _selectedColorIndex;
      await AppRepository.instance.saveQr(widget.qr);
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          showCloseIcon: true,
          content: Text('Đã lưu mã QR'),
        ),
      );
    } catch (e) {
      log(e.toString(), name: 'saveQr');
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          showCloseIcon: true,
          content: Text('Lưu mã QR thất bại'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final qrSize = MediaQuery.of(context).size.width - 32 * 2 - 52 * 2;

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.qr.bank.code} - ${widget.qr.bankNumber}'),
        backgroundColor: Colors.white,
        actions: [
          if (!widget.isSaved)
            IconButton(
              onPressed: _saveQr,
              icon: const Icon(Icons.save_rounded),
            ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                ItemQRCode(
                  qrSize: qrSize,
                  data: data,
                  selectedColor: _selectedColor,
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 32,
                    top: 12,
                  ),
                  height: 80,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: AppColors.colors.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedColorIndex = index;
                        });
                      },
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: AppColors.colors[index],
                            borderRadius: BorderRadius.circular(32),
                          ),
                          alignment: Alignment.center,
                          child: _selectedColorIndex == index
                              ? const Icon(Icons.check,
                                  color: Colors.white, size: 20)
                              : null,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
