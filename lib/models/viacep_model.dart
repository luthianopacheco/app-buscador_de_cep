class ViaCepModel {
  String? _cep;
  String? _logradouro;
  String? _complemento;
  String? _bairro;
  String? _localidade;
  String? _uf;
  String? _ibge;
  String? _gia;
  String? _ddd;
  String? _siafi;

  ViaCepModel(
      {String? cep,
      String? logradouro,
      String? complemento,
      String? bairro,
      String? localidade,
      String? uf,
      String? ibge,
      String? gia,
      String? ddd,
      String? siafi});

  String? get cep => _cep;
  String? get logradouro => _logradouro;
  String? get complemento => _complemento;
  String? get bairro => _bairro;
  String? get localidade => _localidade;
  String? get uf => _uf;
  String? get ibge => _ibge;
  String? get gia => _gia;
  String? get ddd => _ddd;
  String? get siafi => _siafi;

  ViaCepModel.fromJson(Map<String, dynamic> json) {
    _cep = json['cep'];
    _logradouro = json['logradouro'];
    _complemento = json['complemento'];
    _bairro = json['bairro'];
    _localidade = json['localidade'];
    _uf = json['uf'];
    _ibge = json['ibge'];
    _gia = json['gia'];
    _ddd = json['ddd'];
    _siafi = json['siafi'];
  }
}
