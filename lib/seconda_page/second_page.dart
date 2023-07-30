import 'package:flutter/material.dart';

bool soal2 = false;

class SecondPage extends StatefulWidget {
  final bool sebelumnya;
  final int page;
  const SecondPage({super.key, required this.sebelumnya, required this.page});

  @override
  State<SecondPage> createState() => _SecondPage();
}

class _SecondPage extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Soal nomor: ${widget.page}"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: double.infinity,
                height: 100,
                child: Center(
                    child: Text(soal2
                        ? "Upacara bendera memperingati hari kemerdekaan RI"
                        : "Kegiatan tahunan sesuai dengan soal sebelumnya."))),
            Expanded(
                child: GridView.count(
                    crossAxisCount: soal2 ? 1 : 2,
                    children: soal2
                        ? [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset("assets/images/upacara.jpg",
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ]
                        : [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset(
                                    "assets/images/berenang.webp",
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset("assets/images/pasar.jpg",
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    soal2 = true;
                                  });
                                },
                                child: Image.asset(
                                  "assets/images/upacara.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Image.asset("assets/images/perang.webp",
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ])),
          ],
        ));
  }
}
