import 'package:test/test.dart';
import 'package:desafio1_imc/utils/calculate_imc.dart' as utils;

void main() {
  test('Teste IMC para peso normal', () {
    expect(() => utils.calculateImc('Ana', 70, 1.75), prints('''
IMC: 22.9
Ana está com o peso normal
'''));
  });

  test('Teste IMC para obesidade grau II', () {
    expect(() => utils.calculateImc('Cristina', 100, 1.65), prints('''
IMC: 36.7
Cristina está com obesidade grau II
'''));
  });
}
