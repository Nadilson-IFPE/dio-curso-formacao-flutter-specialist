import 'package:my_app_test/my_app_test.dart' as app;
import 'package:test/test.dart';

void main() {
  test('Calcula o valor do produto com desconto sem porcentagem', () {
    expect(app.calcularDesconto(1000, 150, false), equals(850));
  });

  test(
      'Calcula o valor do produto com desconto sem porcentagem passando o valor do produto zerado',
      () {
    expect(() => app.calcularDesconto(0, 150, false),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Calcula o valor do produto com desconto com porcentagem', () {
    expect(app.calcularDesconto(1000, 15, true), equals(850));
  });

  test(
      'Calcula o valor do produto com desconto com porcentagem passando o valor do produto zerado',
      () {
    expect(() => app.calcularDesconto(0, 150, true),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  group('Calcula o valor do produto com desconto', () {
    var valuesToTest = {
      {'valor': 1000, 'desconto': 150, 'percentual': false}: 850,
      {'valor': 1000, 'desconto': 15, 'percentual': true}: 850,
    };
    valuesToTest.forEach((values, expected) {
      test('Entrada: $values Esperado: $expected', () {
        expect(
            app.calcularDesconto(
                double.parse(values["valor"].toString()),
                double.parse(values["desconto"].toString()),
                values["percentual"] == true),
            equals(expected));
      });
    });
  });

  group(
      'Calcula o valor do produto informando valores zerados, deve gerar erro',
      () {
    var valuesToTest = {
      {'valor': 0, 'desconto': 150, 'percentual': false},
      {'valor': 1000, 'desconto': 0, 'percentual': true},
    };
    for (var values in valuesToTest) {
      test('Entrada: $values', () {
        expect(
            () => app.calcularDesconto(
                double.parse(values["valor"].toString()),
                double.parse(values["desconto"].toString()),
                values["percentual"] == true),
            throwsA(TypeMatcher<ArgumentError>()));
      });
    }
  });

  test('Testar conversão para uppercase', () {
    expect(app.convertToUppercase('dio'), equals('DIO'));
  });

  test('Testar conversão para uppercase - teste 2', () {
    expect(app.convertToUppercase('dio'), equalsIgnoringCase('dio'));
  });

  test('Valor maior que 50', () {
    expect(app.retornaValor(50), greaterThanOrEqualTo(50));
  });

  test('Começa com', () {
    expect(app.convertToUppercase('dio'), startsWith('D'));
  });

  test('Valor diferente', () {
    expect(app.retornaValor(50), isNot(equals((49))));
  });
}
