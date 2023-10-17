// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:via_cep_back4app/model/via_cep_back4app_model.dart';
import 'package:via_cep_back4app/model/via_cep_model.dart';
import 'package:via_cep_back4app/repository/via_cep_back4app_repository.dart';
import 'package:via_cep_back4app/repository/via_cep_repository.dart';

class ConsultaViaCepPage extends StatefulWidget {
  const ConsultaViaCepPage({super.key});

  @override
  State<ConsultaViaCepPage> createState() => _ConsultaViaCepPageState();
}

class _ConsultaViaCepPageState extends State<ConsultaViaCepPage> {
  var espaco = const SizedBox(height: 15);
  var est = const TextStyle(fontSize: 17, fontWeight: FontWeight.w700);
  var cepController = TextEditingController(text: "");
  var carregando = false;

  var viacepmodel = ViaCep();
  var viaCepRepository = ViaCepRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListView(
        children: [
          TextField(
            controller: cepController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                hintText: "Cep",
                hintStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          espaco,
          carregando
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Logradouro: ${viacepmodel.logradouro == null ? "" : viacepmodel.logradouro}",
                        style: est,
                      ),
                      espaco,
                      Text(
                        "Complemento: ${viacepmodel.complemento == null ? "" : viacepmodel.complemento}",
                        style: est,
                      ),
                      espaco,
                      Text(
                        "Bairro: ${viacepmodel.bairro == null ? "" : viacepmodel.bairro}",
                        style: est,
                      ),
                      espaco,
                      Text(
                        "Localidade: ${viacepmodel.localidade == null ? "" : viacepmodel.localidade}",
                        style: est,
                      ),
                      espaco,
                      Text(
                        "UF: ${viacepmodel.uf == null ? "" : viacepmodel.uf}",
                        style: est,
                      ),
                      espaco,
                      Text(
                        "IBGE: ${viacepmodel.ibge == null ? "" : viacepmodel.ibge}",
                        style: est,
                      ),
                      espaco,
                      Text(
                        "GIA: ${viacepmodel.gia == null ? "" : viacepmodel.gia}",
                        style: est,
                      ),
                      espaco,
                      Text(
                        "DDD: ${viacepmodel.ddd == null ? "" : viacepmodel.ddd}",
                        style: est,
                      ),
                      espaco,
                      Text(
                        "SIAFI: ${viacepmodel.siafi == null ? "" : viacepmodel.siafi}",
                        style: est,
                      ),
                    ],
                  ),
                ),
          const SizedBox(
            height: 50,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.redAccent)),
                  onPressed: () {
                    cepController.text = "";
                    viacepmodel.logradouro = "";
                    viacepmodel.complemento = "";
                    viacepmodel.bairro = "";
                    viacepmodel.localidade = "";
                    viacepmodel.uf = "";
                    viacepmodel.ibge = "";
                    viacepmodel.gia = "";
                    viacepmodel.ddd = "";
                    viacepmodel.siafi = "";
                    setState(() {});
                  },
                  child: const Text(
                    "Limpar",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
              TextButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                  onPressed: () async {
                    setState(() {
                      carregando = true;
                    });
                    var cep =
                        cepController.text.replaceAll(RegExp(r'[^0-9]'), '');
                    var viacs = ViaCepBack4AppRepository();
                    var viac = await viacs.obterDadosPassados(cep);
                    if (cepController.text.length == 8) {
                      viacepmodel = await viaCepRepository.consultarCep(cep);
                      if (viac.viaCep.length == 0 &&
                          viacepmodel.logradouro != null) {
                        var cepMod = viacepmodel.cep
                            .toString()
                            .replaceAll(RegExp(r'[^0-9]'), '');
                        await viacs.salvar(ViaCepM.criar(
                            cepMod.toString(),
                            viacepmodel.logradouro.toString(),
                            viacepmodel.complemento.toString(),
                            viacepmodel.bairro.toString(),
                            viacepmodel.localidade.toString(),
                            viacepmodel.uf.toString(),
                            viacepmodel.ibge.toString(),
                            viacepmodel.gia.toString(),
                            viacepmodel.ddd.toString(),
                            viacepmodel.siafi.toString()));
                      }
                    }
                    setState(() {
                      carregando = false;
                    });
                  },
                  child: const Text(
                    "Buscar",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
