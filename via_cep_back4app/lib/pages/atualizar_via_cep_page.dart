import 'package:flutter/material.dart';
import 'package:via_cep_back4app/model/via_cep_back4app_model.dart';
import 'package:via_cep_back4app/repository/via_cep_back4app_repository.dart';

class AtualizarViaCepPage extends StatefulWidget {
  final String id;
  const AtualizarViaCepPage({super.key, required this.id});

  @override
  State<AtualizarViaCepPage> createState() => _AtualizarViaCepPageState();
}

class _AtualizarViaCepPageState extends State<AtualizarViaCepPage> {
  late ViaCepBack4AppRepository viaCepBack4AppRepository;
  var viaCepModel = ViaCepBackModel([]);
  var cep = TextEditingController(text: "");
  var logradouro = TextEditingController(text: "");
  var complemento = TextEditingController(text: "");
  var bairro = TextEditingController(text: "");
  var localidade = TextEditingController(text: "");
  var uf = TextEditingController(text: "");
  var ibge = TextEditingController(text: "");
  var gia = TextEditingController(text: "");
  var ddd = TextEditingController(text: "");
  var siafi = TextEditingController(text: "");
  var carregando = false;
  var espaco = const SizedBox(height: 20);
  var estilo = const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);

  @override
  void initState() {
    // TODO: implement initState
    viaCepBack4AppRepository = ViaCepBack4AppRepository();
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    setState(() {
      carregando = true;
    });
    viaCepModel = await viaCepBack4AppRepository.obterDadosAtual(widget.id);
    cep.text = viaCepModel.viaCep.first.cep.toString();
    logradouro.text = viaCepModel.viaCep.first.logradouro.toString();
    complemento.text = viaCepModel.viaCep.first.complemento.toString();
    bairro.text = viaCepModel.viaCep.first.bairro.toString();
    localidade.text = viaCepModel.viaCep.first.localidade.toString();
    uf.text = viaCepModel.viaCep.first.uf.toString();
    ibge.text = viaCepModel.viaCep.first.uf.toString();
    gia.text = viaCepModel.viaCep.first.gia.toString();
    ddd.text = viaCepModel.viaCep.first.ddd.toString();
    siafi.text = viaCepModel.viaCep.first.siafe.toString();
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Alterar",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 12, 83, 35),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: carregando
            ? const CircularProgressIndicator()
            : ListView(children: [
                Text("Cep:", style: estilo),
                TextField(controller: cep),
                espaco,
                Text("Logradouro:", style: estilo),
                TextField(controller: logradouro),
                espaco,
                Text("Complemento:", style: estilo),
                TextField(controller: complemento),
                espaco,
                Text("Bairro:", style: estilo),
                TextField(controller: bairro),
                espaco,
                Text("Localidade:", style: estilo),
                TextField(controller: localidade),
                espaco,
                Text("UF:", style: estilo),
                TextField(controller: uf),
                espaco,
                Text("IBGE:", style: estilo),
                TextField(controller: ibge),
                espaco,
                Text("GIA:", style: estilo),
                TextField(controller: gia),
                espaco,
                Text("DDD:", style: estilo),
                TextField(controller: ddd),
                espaco,
                Text("SIAFI:", style: estilo),
                TextField(controller: siafi),
                const SizedBox(
                  height: 50,
                ),
                Center(
                    child: TextButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.blue)),
                        onPressed: () async {
                          await viaCepBack4AppRepository.atualizar(
                              ViaCepM.alterar(
                                  widget.id,
                                  cep.text,
                                  logradouro.text,
                                  complemento.text,
                                  bairro.text,
                                  localidade.text,
                                  uf.text,
                                  ibge.text,
                                  gia.text,
                                  ddd.text,
                                  siafi.text));

                          Navigator.pop(context);
                        },
                        child: const Text("Salvar",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold))))
              ]),
      ),
    ));
  }
}
