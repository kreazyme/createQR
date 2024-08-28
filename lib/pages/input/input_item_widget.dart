import 'package:banking/models/bank_model.dart';
import 'package:flutter/material.dart';

class InputItemWidget extends StatelessWidget {
  const InputItemWidget({
    super.key,
    this.isSelected = true,
    required this.bank,
    required this.onTap,
  });

  final bool isSelected;
  final BankModel bank;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      decoration: BoxDecoration(
        color:
            isSelected ? Colors.deepPurple.withOpacity(0.4) : Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          padding: const EdgeInsets.all(8),
          child: Image.network(
            bank.logo ?? '',
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(bank.name ?? ''),
        subtitle: Text(bank.code ?? ''),
        trailing: Container(
          padding: const EdgeInsets.only(
            right: 4,
          ),
          child: isSelected
              ? const Icon(
                  Icons.check,
                  size: 24,
                )
              : const SizedBox(
                  width: 24,
                ),
        ),
        onTap: () {
          onTap();
        },
      ),
    );
  }
}
