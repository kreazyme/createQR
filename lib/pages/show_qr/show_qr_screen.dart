import 'dart:typed_data';

import 'package:banking/data/colors.dart';
import 'package:banking/pages/show_qr/item_qr_code_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zxing2/qrcode.dart';
import 'package:image/image.dart' as img;

class ShowQRScreen extends StatefulWidget {
  const ShowQRScreen({
    super.key,
    required this.qrCode,
  });

  final String qrCode;

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

  Future<void> _downloadVideo() async {
    try {
      Response response = await Dio().get(
        widget.qrCode,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return (status ?? 400) < 500;
            }),
      );
      var image = img.decodePng(response.data)!;

      LuminanceSource source = RGBLuminanceSource(
          image.width,
          image.height,
          image
              .convert(numChannels: 4)
              .getBytes(order: img.ChannelOrder.abgr)
              .buffer
              .asInt32List());
      var bitmap = BinaryBitmap(GlobalHistogramBinarizer(source));
      var reader = QRCodeReader();
      var result = reader.decode(bitmap);
      setState(() {
        data = result.text;
        qrImage = response.data;
        _isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _downloadVideo();
  }

  @override
  Widget build(BuildContext context) {
    final qrSize = MediaQuery.of(context).size.width - 32 * 2 - 52 * 2;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mã QR của bạn"),
        backgroundColor: Colors.white,
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.save_outlined,
        //       size: 24,
        //     ),
        //   )
        // ],
      ),
      body: Container(
        child: _isLoading
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
                              borderRadius: BorderRadius.circular(32),
                              color: AppColors.colors[index],
                            ),
                            alignment: Alignment.center,
                            child: _selectedColorIndex == index
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 20,
                                  )
                                : null,
                          ),
                        ),
                      ),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 12,
                      ),
                      itemCount: AppColors.colors.length,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
