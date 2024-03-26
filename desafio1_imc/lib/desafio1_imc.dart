import 'dart:io';

import 'package:desafio1_imc/classes/pessoa.dart';
import 'package:desafio1_imc/exceptions/altura_invalida_exception.dart';
import 'package:desafio1_imc/exceptions/nome_invalido_exception.dart';
import 'package:desafio1_imc/exceptions/peso_invalido_exception.dart';
import 'package:desafio1_imc/utils/calculate_imc.dart';

void executeApp() {
  print("Bem vindo ao app de cálculo de IMC!");
  print("\nInforme o nome:");
  String nome = stdin.readLineSync() ?? "";
  try {
    if (nome.trim() == "") {
      throw NomeInvalidoException();
    }
  } catch (NomeInvalidoException) {
    print(NomeInvalidoException);
    exit(0);
  }

  print("\nInforme o peso:");
  var peso = stdin.readLineSync() ?? "";
  try {
    if (peso.trim() == "") {
      throw PesoInvalidoException();
    }
  } catch (PesoInvalidoException) {
    print(PesoInvalidoException);
    exit(0);
  }

  print("\nInforme a altura (ex.: 1.65):");
  var altura = stdin.readLineSync() ?? "";
  try {
    if (altura.trim() == "") {
      throw AlturaInvalidaException();
    }
  } catch (AlturaInvalidaException) {
    print(AlturaInvalidaException);
    exit(0);
  }

  print("\n------------RESULTADO-------------\n");

  var pessoa = Pessoa(nome, double.parse(peso), double.parse(altura));

  calculateImc(pessoa.getNome(), pessoa.getPeso(), pessoa.getAltura());

  print("\n----------------------------------\n");
}
