import 'package:via_cep_back4app/model/via_cep_back4app_model.dart';
import 'package:via_cep_back4app/repository/custom_dio.dart';

class ViaCepBack4AppRepository {
  var dio = CustomDio();

  ViaCepBack4AppRepository();

  Future<ViaCepBackModel> obterDados() async {
    var result = await dio.dio.get("/viaCep");
    return ViaCepBackModel.fromJson(result.data);
  }

  Future<ViaCepBackModel> obterDadosAtual(String id) async {
    var url = "/viaCep";
    url = "$url?where={\"objectId\":\"$id\"}";
    var result = await dio.dio.get(url);
    return ViaCepBackModel.fromJson(result.data);
  }

  Future<ViaCepBackModel> obterDadosPassados(String cep) async {
    var url = "/viaCep";
    url = "$url?where={\"cep\":\"$cep\"}";
    var result = await dio.dio.get(url);
    return ViaCepBackModel.fromJson(result.data);
  }

  Future<void> salvar(ViaCepM viaCepM) async {
    try {
      await dio.dio.post("/viaCep", data: viaCepM.toJsonCreate());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> atualizar(ViaCepM viaCepM) async {
    try {
      await dio.dio
          .put("/viaCep/${viaCepM.objectId}", data: viaCepM.toJsonCreate());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> remover(String objectId) async {
    try {
      await dio.dio.delete("/viaCep/$objectId");
    } catch (e) {
      rethrow;
    }
  }
}
