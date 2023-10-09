class CepListModel {
  String? _objectId;
  String? _cep;
  String? _logradouro;
  String? _localidade;
  String? _ibge;
  String? _ddd;
  String? _siafi;
  String? _uf;
  String? _bairro;
  String? _gia;
  String? _complemento;
  String? _createdAt;
  String? _updatedAt;

  CepListModel(
      {String? objectId,
      String? cep,
      String? logradouro,
      String? localidade,
      String? ibge,
      String? ddd,
      String? siafi,
      String? uf,
      String? bairro,
      String? gia,
      String? complemento,
      String? createdAt,
      String? updatedAt}) {
    if (objectId != null) {
      _objectId = objectId;
    }
    if (cep != null) {
      _cep = cep;
    }
    if (logradouro != null) {
      _logradouro = logradouro;
    }
    if (localidade != null) {
      _localidade = localidade;
    }
    if (ibge != null) {
      _ibge = ibge;
    }
    if (ddd != null) {
      _ddd = ddd;
    }
    if (siafi != null) {
      _siafi = siafi;
    }
    if (uf != null) {
      _uf = uf;
    }
    if (bairro != null) {
      _bairro = bairro;
    }
    if (gia != null) {
      _gia = gia;
    }
    if (complemento != null) {
      _complemento = complemento;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }
  CepListModel.create(
      {String? objectId,
      String? cep,
      String? logradouro,
      String? localidade,
      String? ibge,
      String? ddd,
      String? siafi,
      String? uf,
      String? bairro,
      String? gia,
      String? complemento,
      String? createdAt,
      String? updatedAt}) {
    if (objectId != null) {
      _objectId = objectId;
    }
    if (cep != null) {
      _cep = cep;
    }
    if (logradouro != null) {
      _logradouro = logradouro;
    }
    if (localidade != null) {
      _localidade = localidade;
    }
    if (ibge != null) {
      _ibge = ibge;
    }
    if (ddd != null) {
      _ddd = ddd;
    }
    if (siafi != null) {
      _siafi = siafi;
    }
    if (uf != null) {
      _uf = uf;
    }
    if (bairro != null) {
      _bairro = bairro;
    }
    if (gia != null) {
      _gia = gia;
    }
    if (complemento != null) {
      _complemento = complemento;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  String? get objectId => _objectId;
  set objectId(String? objectId) => _objectId = objectId;
  String? get cep => _cep;
  set cep(String? cep) => _cep = cep;
  String? get logradouro => _logradouro;
  set logradouro(String? logradouro) => _logradouro = logradouro;
  String? get localidade => _localidade;
  set localidade(String? localidade) => _localidade = localidade;
  String? get ibge => _ibge;
  set ibge(String? ibge) => _ibge = ibge;
  String? get ddd => _ddd;
  set ddd(String? ddd) => _ddd = ddd;
  String? get siafi => _siafi;
  set siafi(String? siafi) => _siafi = siafi;
  String? get uf => _uf;
  set uf(String? uf) => _uf = uf;
  String? get bairro => _bairro;
  set bairro(String? bairro) => _bairro = bairro;
  String? get gia => _gia;
  set gia(String? gia) => _gia = gia;
  String? get complemento => _complemento;
  set complemento(String? complemento) => _complemento = complemento;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  CepListModel.fromJson(Map<String, dynamic> json) {
    _objectId = json['objectId'];
    _cep = json['cep'];
    _logradouro = json['logradouro'];
    _localidade = json['localidade'];
    _ibge = json['ibge'];
    _ddd = json['ddd'];
    _siafi = json['siafi'];
    _uf = json['uf'];
    _bairro = json['bairro'];
    _gia = json['gia'];
    _complemento = json['complemento'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = _objectId;
    data['cep'] = _cep;
    data['logradouro'] = _logradouro;
    data['localidade'] = _localidade;
    data['ibge'] = _ibge;
    data['ddd'] = _ddd;
    data['siafi'] = _siafi;
    data['uf'] = _uf;
    data['bairro'] = _bairro;
    data['gia'] = _gia;
    data['complemento'] = _complemento;
    data['createdAt'] = _createdAt;
    data['updatedAt'] = _updatedAt;
    return data;
  }

  Map<String, dynamic> toJsonSimplified() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cep'] = _cep;
    data['logradouro'] = _logradouro;
    data['localidade'] = _localidade;
    data['ibge'] = _ibge;
    data['ddd'] = _ddd;
    data['siafi'] = _siafi;
    data['uf'] = _uf;
    data['bairro'] = _bairro;
    data['gia'] = _gia;
    data['complemento'] = _complemento;
    return data;
  }
}
