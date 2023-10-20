import 'package:banking/models/Bank.model.dart';
import 'package:flutter/material.dart';

class InputItemWidget extends StatelessWidget {
  const InputItemWidget({
    super.key,
    required this.isSelected,
    required this.bank,
    required this.onTap,
  });

  final bool isSelected;
  final BankModel bank;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Image.network(bank.logo ?? ''),
        title: Text(bank.name ?? ''),
        subtitle: Text(bank.code ?? ''),
        trailing: isSelected ? const Icon(Icons.check) : null,
        onTap: () {
          onTap();
        },
      ),
    );
  }
}
