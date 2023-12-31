import 'package:banking/input_item_widget.dart';
import 'package:banking/models/Bank.model.dart';
import 'package:banking/show_qr_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  List<BankModel> banks = [];
  List<BankModel> allBanks = [];
  int selectedIndex = -1;
  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _filterController = TextEditingController();
  bool isLoading = false;
  String filter = '';

  @override
  void initState() {
    super.initState();
    getBanks();
    _filterController.addListener(() {
      filter = _filterController.text;
      setState(() {
        banks = allBanks
            .where(
              (bank) =>
                  bank.name?.toLowerCase().contains(filter.toLowerCase()) ??
                  false,
            )
            .toList();
      });
    });
  }

  Future<void> getBanks() async {
    setState(() {
      isLoading = true;
    });
    final response = await Dio().get('https://api.vietqr.io/v2/banks');
    setState(() {
      allBanks = Autogenerated.fromJson(response.data).data ?? [];
      banks = allBanks;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nhap thong tin ngan hang vao"),
        actions: [
          GestureDetector(
            onTap: () {
              if (_textEditingController.text.isNotEmpty &&
                  selectedIndex != -1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowQRScreen(
                      qrCode:
                          'https://img.vietqr.io/image/${banks[selectedIndex].shortName}-${_textEditingController.text}-compact.png?amount=%3CAMOUNT%3E&addInfo=%3CDESCRIPTION%3E&accountName=%3CACCOUNT_NAME%3E',
                    ),
                  ),
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: const Text(
                "Tạo QR",
              ),
            ),
          )
        ],
      ),
      body: Builder(
        builder: (context) => isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Nhập số tài khoản ngân hàng',
                        border: OutlineInputBorder(),
                      ),
                      controller: _textEditingController,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(16),
                    child: TextField(
                      controller: _filterController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.search),
                      ),
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => InputItemWidget(
                          isSelected: index == selectedIndex,
                          bank: banks[index],
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          }),
                      separatorBuilder: (context, index) => const Divider(
                        height: 5,
                        color: Colors.transparent,
                      ),
                      itemCount: banks.length,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
