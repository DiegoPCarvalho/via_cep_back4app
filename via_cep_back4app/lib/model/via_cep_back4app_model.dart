class ViaCepBackModel {
  List<ViaCepM> viaCep = [];

  ViaCepBackModel(this.viaCep);

  ViaCepBackModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      viaCep = <ViaCepM>[];
      json['results'].forEach((v) {
        viaCep.add(ViaCepM.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = viaCep.map((v) => v.toJson()).toList();
    return data;
  }
}

class ViaCepM {
  String objectId = "";
  String cep = "";
  String logradouro = "";
  String complemento = "";
  String bairro = "";
  String localidade = "";
  String uf = "";
  String ibge = "";
  String gia = "";
  String ddd = "";
  String siafe = "";
  String createdAt = "";
  String updatedAt = "";

  ViaCepM(
      this.objectId,
      this.cep,
      this.logradouro,
      this.complemento,
      this.bairro,
      this.localidade,
      this.uf,
      this.ibge,
      this.gia,
      this.ddd,
      this.siafe,
      this.createdAt,
      this.updatedAt);

  ViaCepM.criar(this.cep, this.logradouro, this.complemento, this.bairro,
      this.localidade, this.uf, this.ibge, this.gia, this.ddd, this.siafe);

  ViaCepM.alterar(
      this.objectId,
      this.cep,
      this.logradouro,
      this.complemento,
      this.bairro,
      this.localidade,
      this.uf,
      this.ibge,
      this.gia,
      this.ddd,
      this.siafe);

  ViaCepM.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    cep = json['cep'];
    logradouro = json['logradouro'];
    complemento = json['complemento'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    ibge = json['ibge'];
    gia = json['gia'];
    ddd = json['ddd'];
    siafe = json['siafe'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['complemento'] = complemento;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    data['ibge'] = ibge;
    data['gia'] = gia;
    data['ddd'] = ddd;
    data['siafe'] = siafe;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  Map<String, dynamic> toJsonCreate() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['complemento'] = complemento;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    data['ibge'] = ibge;
    data['gia'] = gia;
    data['ddd'] = ddd;
    data['siafe'] = siafe;
    return data;
  }
}
