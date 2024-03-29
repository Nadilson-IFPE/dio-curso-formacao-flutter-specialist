import 'package:flutter/material.dart';

class DadosCadastrais extends StatelessWidget {
  final String texto;
  final List<String> dados;

  const DadosCadastrais({super.key, required this.texto, required this.dados});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(texto),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(dados.length.toString()),
      ),
    );
  }
}
