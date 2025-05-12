import 'package:flutter/material.dart';
import "./questao.dart";
import "./resposta.dart";

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      "texto": "Qual a sua cor favorita??",
      "respostas": ["Azul", "Preto", "Branco"],
    },
    {
      "texto": "Qual sua idade??",
      "respostas": ["18", "19", "20"],
    },
    {
      "texto": "Qual o nome da aplicação??",
      "respostas": ["Flutter", "Dart", "JavaScript"],
    },
  ];

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas =
        temPerguntaSelecionada
            ? _perguntas[_perguntaSelecionada]["respostas"] as List<String>
            : [];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown,
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            child: Text(
              "Olá mundo!!",
              style: TextStyle(fontSize: 40),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: temPerguntaSelecionada ?
         Column(
          children: [
            Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
            ...respostas.map((t) => Resposta(t, _responder)),
          ],
      ): Questao("Acabou as perguntas"),
      ),
    );
  }
}
