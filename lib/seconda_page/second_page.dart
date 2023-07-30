import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final bool sebelumnya;
  const SecondPage({super.key, required this.sebelumnya});

  @override
  State<SecondPage> createState() => _SecondPage();
}

class _SecondPage extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ini"),
      ),
    );
  }
}
