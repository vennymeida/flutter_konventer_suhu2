import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_konventer_suhu2/widget/button.dart';
import 'package:flutter_konventer_suhu2/widget/dropdown.dart';
import 'package:flutter_konventer_suhu2/widget/result.dart';
import 'package:flutter_konventer_suhu2/widget/history.dart';

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
  double result = 0;
  var jenisSuhu = ["Kelvin", "Reamur"];
  var selectedSuhu = "Kelvin";
  List<String> history = <String>[];

  setSelectedSuhu(String value) {
    setState(() {
      selectedSuhu = value.toString();
    });
  }

  konventerSuhu() {
    setState(() {
      if (_controllerCelcius.text.isNotEmpty) {
        _inputCelcius = double.parse(_controllerCelcius.text);
        if (selectedSuhu == "Kelvin") {
          result = _inputCelcius + 273;
        }
        if (selectedSuhu == "Reamur") {
          result = _inputCelcius * 0.8;
        }

        history.add("$selectedSuhu : $result");
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
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _controllerCelcius,
            ),
            DropdownSuhu(
              jenisSuhu: jenisSuhu,
              selectedSuhu: selectedSuhu,
              setSelectedSuhu: setSelectedSuhu,
            ),
            ResultKonversi(
              result: result,
            ),
            ButtonKonversi(
              konversi: konventerSuhu,
            ),
            const Text(
              "Riwayat Konversi",
              style: TextStyle(fontSize: 20),
            ),
            History(history: history),
          ],
        ),
      ),
    );
  }
}
