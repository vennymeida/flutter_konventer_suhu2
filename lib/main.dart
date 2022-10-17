import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_konventer_suhu2/widget/button.dart';
import 'package:flutter_konventer_suhu2/widget/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Konventer Suhu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controllerCelcius = TextEditingController();
  double _inputCelcius = 0;
  double _kelvin = 0;
  double _reamur = 0;

  konventerSuhu() {
    setState(() {
      if (_controllerCelcius.text.isNotEmpty) {
        _inputCelcius = double.parse(_controllerCelcius.text);
        _kelvin = _inputCelcius + 273.15;
        _reamur = _inputCelcius * 0.8;
      }
    });
  }

  @override
  void dispose() {
    _controllerCelcius.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _controllerCelcius,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ResultKonversi(
                    result: _kelvin,
                    jenis: 'Kelvin',
                  ),
                ),
                Expanded(
                  child: ResultKonversi(
                    result: _reamur,
                    jenis: 'Reamur',
                  ),
                ),
              ],
            ),
            ButtonKonversi(
              konversi: konventerSuhu,
            ),
          ],
        ),
      ),
    );
  }
}
