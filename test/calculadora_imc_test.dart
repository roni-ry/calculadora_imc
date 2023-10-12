import 'package:calculadora_imc/calculadora_imc.dart';
import 'package:calculadora_imc/pessoa.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });

  test('inputDouble', () {
    expect(inputD('0'), equals(30));
  });
  test('imc', () {
    Pessoa p = Pessoa.create('roni', 80, 1.8);
    expect(
        calculateImc(p),
        equals(
            'Nome:roni - Peso:80.0kg - Altura:1.8m : IMC de 24.7 - {Saudavel - IMC 18.5 : 25.0}'));
  });
}
