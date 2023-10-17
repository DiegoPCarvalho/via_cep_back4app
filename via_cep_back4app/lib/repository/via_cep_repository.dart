import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:via_cep_back4app/model/via_cep_model.dart';

class ViaCepRepository {
  Future<ViaCep> consultarCep(String cep) async {
    var response =
        await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ViaCep.fromJson(json);
    }
    return ViaCep();
  }
}
