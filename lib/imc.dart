import 'dart:io';
import 'dart:convert';

import 'package:calculadora_imc/pessoa.dart';

abstract class Console {
  void init();
  void processInput();
  void showResults();
}

class Imc implements Console {
  late Pessoa pessoa;
  final getPessoas = <Pessoa>{};
  final Map<String, double> baseImc = {
    'Magreza grave    - IMC 0         ': 16,
    'Magreza moderada - IMC 16        ': 17.0,
    'Magreza leve     - IMC 17        ': 18.5,
    'Saudavel         - IMC 18.5      ': 25,
    'Sobrepeso        - IMC 25        ': 30,
    'Obesidade Grau 1 - IMC 30        ': 35,
    'Obesidade Grau 2 - IMC 35        ': 40,
    'Obesidade Grau 3 - IMC Maior que ': 40,
  };

  @override
  void init() {
    // TODO: implement init
    print('Bem vindo a Calculadora de IMC');
    print('Bases para IMC: \n');
    baseImc.forEach((key, value) {
      print('$key : $value');
    });
    print('\n');
    processInput();
  }

  @override
  void processInput() {
    // TODO: implement process_input
    String nome = inputNome('Nome');
    double peso = inputDouble('Peso');
    double altura = inputDouble('Altura');

    getPessoas.add(Pessoa.create(nome, peso, altura));
  }

  @override
  void showResults() {
    // TODO: implement show_results
    if (getPessoas.isNotEmpty) {
      for (var element in getPessoas) {
        print(calculateImc(element));
      }
    }
  }

  String inputNome(String text) {
    print('Entre com $text: ');
    var value = stdin.readLineSync(encoding: utf8);
    return value.toString();
  }

  double inputDouble(String text) {
    print('Entre com $text: ');
    double? val;
    do {
      var value = stdin.readLineSync(encoding: utf8).toString();
      val = double.tryParse(value);
      if (valueValid(val)) {
        print('Por favor insira um valor válido:');
      }
    } while (valueValid(val));
    return val!;
  }

  bool valueValid(double? value) {
    return value == null || value <= 0;
  }

  String calculateImc(Pessoa p) {
    Map<String, double> result = <String, double>{};
    double peso = p.getPeso();
    double alt = p.getAltura();

    var calc = (peso / (alt * alt));
    var imcFormatado = calc.toStringAsFixed(1);

    if (calc < baseImc.entries.elementAt(0).value) {
      result[baseImc.entries.elementAt(0).key] =
          baseImc.entries.elementAt(0).value;
    } else if (calc < baseImc.entries.elementAt(1).value) {
      result[baseImc.entries.elementAt(1).key] =
          baseImc.entries.elementAt(1).value;
    } else if (calc < baseImc.entries.elementAt(2).value) {
      result[baseImc.entries.elementAt(2).key] =
          baseImc.entries.elementAt(2).value;
    } else if (calc < baseImc.entries.elementAt(3).value) {
      result[baseImc.entries.elementAt(3).key] =
          baseImc.entries.elementAt(3).value;
    } else if (calc < baseImc.entries.elementAt(4).value) {
      result[baseImc.entries.elementAt(4).key] =
          baseImc.entries.elementAt(4).value;
    } else if (calc < baseImc.entries.elementAt(5).value) {
      result[baseImc.entries.elementAt(5).key] =
          baseImc.entries.elementAt(5).value;
    } else if (calc < baseImc.entries.elementAt(6).value) {
      result[baseImc.entries.elementAt(6).key] =
          baseImc.entries.elementAt(6).value;
    } else {
      result[baseImc.entries.elementAt(7).key] =
          baseImc.entries.elementAt(7).value;
    }
    return '$p : IMC de $imcFormatado - $result';
  }
}
