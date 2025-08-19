import 'package:flutter/material.dart';

class CepInfoRow extends StatelessWidget {
  const CepInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.pin_drop_outlined, color: Colors.black, size: 18),
        SizedBox(width: 6),
        Text(
          'Informe seu cep',
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        SizedBox(width: 6),
        Icon(Icons.arrow_forward_ios, color: Colors.black, size: 14),
      ],
    );
  }
}
