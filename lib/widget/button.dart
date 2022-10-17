import 'package:flutter/material.dart';

class ButtonKonversi extends StatelessWidget {
  const ButtonKonversi({super.key, required this.konversi});

  final Function konversi;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => konversi(),
            child: Text("Konversi Suhu"),
          ),
        ),
      ],
    );
  }
}
