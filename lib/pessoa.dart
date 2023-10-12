class Pessoa
{
  String _nome = '';
  double _peso = 0.0;
  double _altura = 0.0;

  void nome(String value) {
    _nome = value;
  }
  void peso(double value) {
    _peso = value;
  }
  void altura(double value) {
    _altura = value;
  }

  String getNome() => _nome;
  double getPeso() => _peso;
  double getAltura() => _altura;

  @override
  String toString() {
    return 'Nome:$_nome - Peso:${_peso}kg - Altura:${_altura}m';
  }

  Pessoa.create(this._nome, this._peso, this._altura);
}