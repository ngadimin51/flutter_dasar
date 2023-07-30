
import 'package:flutter/material.dart';

bool soal3 = false;

class ThirdPage extends StatefulWidget {
  final bool sebelumnya;
  final int page;
  const ThirdPage({super.key, required this.sebelumnya, required this.page});

  @override
  State<ThirdPage> createState() => _Thirdpage();
}

class _Thirdpage extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("MERDEKA!!!"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Dirgahayu RI ke 78.\nJayalah selalu INDONESIA.\nMERDEKA",
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Image.asset("assets/images/celebration.gif",
                  fit: BoxFit.cover),
            )
          ],
        ));
  }
}
