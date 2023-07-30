import 'package:flutter/material.dart';
import 'package:quiz/seconda_page/second_page.dart';

bool soal1 = false;

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
  var _answer =
      soal1 ? "Anda sudah mengerjakan soal ini" : "Isilah form dibawah ini";
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
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
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
                                          soal1 = true;
                                        });
                                      } else {
                                        setState(() {
                                          _answer = "Coba lagi";
                                        });
                                      }
                                      return null;
                                    },
                                    initialValue: soal1 ? "15" : "",
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
                        const Padding(
                          padding: EdgeInsets.all(10),
                          child:
                              Text("Angka awal ditambah angka akhir. Merdeka!"),
                        ),
                        Image(
                            image: AssetImage('assets/images/hut_ri_78.png'),
                            fit: BoxFit.contain,
                            width: MediaQuery.of(context).size.width * 0.9),
                      ]),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 5.0),
            child: soal1
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SecondPage(sebelumnya: soal1, page: 2)),
                            );
                          },
                          backgroundColor:
                              const Color.fromARGB(255, 0, 106, 255),
                          child: const Icon(Icons.open_in_new,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ])
                : null, // This trailing comma makes auto-formatting nicer for build methods.,
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
