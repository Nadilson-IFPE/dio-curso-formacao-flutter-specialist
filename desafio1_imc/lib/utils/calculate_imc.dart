import 'dart:io';

void calculateImc(String nome, double peso, double altura) {
  double imc = peso / (altura * altura);

  if (imc.isNaN || imc.isInfinite || imc == 0) {
    print(
        "\nO cálculo de IMC não resultou em um valor válido. Verifique se informou peso e altura corretamente.");
    exit(0);
  }

  var _result = "IMC: ${imc.toStringAsPrecision(3)}\n";
  if (imc <= 18.5) {
    _result += "$nome está abaixo do peso";
  } else if (imc >= 18.6 && imc < 25.0) {
    _result += "$nome está com o peso normal";
  } else if (imc >= 25.0 && imc < 30.0) {
    _result += "$nome está acima do peso normal";
  } else if (imc >= 30.0 && imc < 35.0) {
    _result += "$nome está com obesidade grau I";
  } else if (imc >= 35.0 && imc < 40.0) {
    _result += "$nome está com obesidade grau II";
  } else if (imc > 40.0) {
    _result += "$nome está com obesidade grau III";
  }

  print(_result);
}
