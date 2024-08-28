import 'package:banking/models/qr_model.dart';
import 'package:banking/pages/history_qr/history_qr_item_widget.dart';
import 'package:banking/pages/show_qr/show_qr_screen.dart';
import 'package:banking/repositories/app_repository.dart';
import 'package:flutter/material.dart';

class HistoryQrScreen extends StatefulWidget {
  const HistoryQrScreen({super.key});

  @override
  State<HistoryQrScreen> createState() => _HistoryQrScreenState();
}

class _HistoryQrScreenState extends State<HistoryQrScreen> {
  List<QrModel> _qrs = [];

  @override
  void initState() {
    _loadQrs();
    super.initState();
  }

  void _loadQrs() async {
    _qrs = await AppRepository.instance.getQrs();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mã QR đã lưu'),
      ),
      body: Center(
        child: ListView.separated(
          itemBuilder: (context, index) => HistoryQrItemWidget(
              qr: _qrs[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowQRScreen(
                      _qrs[index],
                      isSaved: true,
                    ),
                  ),
                );
              }),
          separatorBuilder: (context, index) => const Divider(
            height: 5,
            color: Colors.transparent,
          ),
          itemCount: _qrs.length,
        ),
      ),
    );
  }
}
