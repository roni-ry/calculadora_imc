import 'package:calculadora_imc/pessoa.dart';

int calculate() {
  return 6 * 7;
}

final Map<String, double> baseImc = {
  'Magreza grave -        IMC 0     ': 16,
  'Magreza moderada -     IMC 16    ': 17.0,
  'Magreza leve -         IMC 17    ': 18.5,
  'Saudavel -             IMC 18.5  ': 25,
  'Sobrepeso -            IMC 25    ': 30,
  'Obesidade Grau 1 -     IMC 30    ': 35,
  'Obesidade Grau 2 -     IMC 35    ': 40,
  'Obesidade Grau 3 -     IMC Maior ': 40,
};
double inputD(String text) {
  double? val;
  do {
    try {
      val = double.tryParse(text);
    } catch (e) {
      print(e);
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
