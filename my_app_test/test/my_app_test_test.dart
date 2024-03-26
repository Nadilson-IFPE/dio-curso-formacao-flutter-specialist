import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app_test/classes/viacep.dart';
import 'package:my_app_test/my_app_test.dart' as app;
import 'package:test/test.dart';

import 'my_app_test_test.mocks.dart';

@GenerateMocks([MockViaCEP])
// Após instalar os packages mockito (em "dependencies") e build_runner (em "dev_dependencies"),
// execute no terminal o seguinte comando depois de adicionar a anotação @GenerateMocks([MockViaCEP]):
// dart run build_runner build --delete-conflicting-outputs

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

  test('Retornar CEP', () async {
    //ViaCEP viacep = ViaCEP();
    MockMockViaCEP mockMockViaCEP = MockMockViaCEP();
    when(mockMockViaCEP.retornarCEP('01001000'))
        .thenAnswer((realInvocation) => Future.value({
              "cep": "01001-000",
              "logradouro": "Praça da Sé",
              "complemento": "lado ímpar",
              "bairro": "Sé",
              "localidade": "São Paulo",
              "uf": "SP",
              "ibge": "3550308",
              "gia": "1004",
              "ddd": "11",
              "siafi": "7107"
            }));
    //var body = await viacep.retornarCEP("01001000");
    var body = await mockMockViaCEP.retornarCEP("01001000");
    expect(body["bairro"], equals('Sé'));
    expect(body["logradouro"], equals('Praça da Sé'));
  });
}

class MockViaCEP extends Mock implements ViaCEP {}
