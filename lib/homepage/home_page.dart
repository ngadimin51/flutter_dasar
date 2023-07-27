import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// bool pass = true;

// class HomePage untuk file main.dart bersifat statefull
class HomePage extends StatefulWidget {
  final int page;
  const HomePage({super.key, required this.page});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  // Untuk pageview
  var _index = 0;
  var _answer = "Isilah form dibawah ini";
  final _formKey = GlobalKey<FormState>();
  late PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: _index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Soal Nomor: ${widget.page}"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: PageView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "$_answer",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(20),
                        child: Form(
                            key: _formKey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextFormField(
                                    // The validator receives the text that the user has entered.
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      } else if (value == "15") {
                                        setState(() {
                                          _answer = "Jawaban anda benar!!!";
                                        });
                                      } else {
                                        setState(() {
                                          _answer = "Coba lagi";
                                        });
                                      }
                                      return null;
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        // Validate returns true if the form is valid, or false otherwise.
                                        if (_formKey.currentState!.validate()) {
                                          // lanjutkan ke halaman selanjutnya
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                content:
                                                    Text('Processing Data')),
                                          );
                                        }
                                      },
                                      child: Text(
                                          _answer == "Jawaban anda benar!!!"
                                              ? "Selanjutnya"
                                              : "Submit"),
                                    ),
                                  ),
                                ])))
                  ],
                ),
                SizedBox(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child:
                              Text("Angka awal ditambah angka akhir. Merdeka!"),
                        ),
                        Image.network(
                          'https://png.pngtree.com/png-vector/20230414/ourlarge/pngtree-hut-ri-78-official-logo-in-2023-vector-png-image_6704672.png',
                          fit: BoxFit.cover,
                          width: 300,
                          height: 300,
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: "Task",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: "Help",
          ),
        ],
        onTap: (index) {
          setState(() {
            _index = index;
            controller.animateToPage(_index,
                duration: const Duration(milliseconds: 900),
                curve: Curves.bounceOut);
          });
        },
      ),
    );
  }
}
