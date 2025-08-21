import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InstallmentText extends StatelessWidget {
  final double total;
  final int times;

  const InstallmentText({super.key, required this.total, this.times = 10});

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    final perInstallment = total / times;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 12, color: Colors.black),
          children: [
            const TextSpan(text: 'em '),
            TextSpan(
              text: '${times}x ${currency.format(perInstallment)} sem juros',
              style: const TextStyle(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
