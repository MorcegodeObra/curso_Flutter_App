import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String resposta;
  final void Function() quandoSelecionado;

  const Resposta(this.resposta, this.quandoSelecionado,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.blue),
        ),
        onPressed: quandoSelecionado,
        child: Text(resposta, style: TextStyle(color: Colors.purple)),
      ),
    );
  }
}
