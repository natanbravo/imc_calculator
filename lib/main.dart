import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'IMC Calculator';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String pesoText = '';
  String alturaText = '';

  String resultadoIMC = '';

  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();

  final userAvatarUrl = 'https://avatars.githubusercontent.com/u/97315038?v=4';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: (Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Calcular IMC',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: controllerPeso,
                  onChanged: (value) {
                    pesoText = value;
                  },
                  decoration: const InputDecoration(
                      labelText: 'Peso',
                      hintText: 'Digite seu peso em KG',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.0)))),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: controllerAltura,
                  onChanged: (value) {
                    alturaText = value;
                  },
                  decoration: const InputDecoration(
                      labelText: 'Altura',
                      hintText: 'Digite sua altura em CM',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.0)))),
                ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  resultadoIMC,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 32,
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        num valorDigitadoUsuario =
                            ((num.parse(controllerPeso.text)) /
                                (num.parse(controllerAltura.text)) *
                                (num.parse(controllerAltura.text)));
                        resultadoIMC = valorDigitadoUsuario.toStringAsFixed(2);
                      });
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.orangeAccent,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Text('Calcular'))
              ],
            ))),
      ),
    );
  }
}
