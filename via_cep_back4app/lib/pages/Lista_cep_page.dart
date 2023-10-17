import 'package:flutter/material.dart';
import 'package:via_cep_back4app/model/via_cep_back4app_model.dart';
import 'package:via_cep_back4app/pages/atualizar_via_cep_page.dart';
import 'package:via_cep_back4app/repository/via_cep_back4app_repository.dart';

class ListaCepPage extends StatefulWidget {
  const ListaCepPage({super.key});

  @override
  State<ListaCepPage> createState() => _ListaCepPageState();
}

class _ListaCepPageState extends State<ListaCepPage> {
  late ViaCepBack4AppRepository viaCepBack4AppRepository;
  var _viacep = ViaCepBackModel([]);
  bool carregando = false;

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
    _viacep = await viaCepBack4AppRepository.obterDados();
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: carregando
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: _viacep.viaCep.length,
                  itemBuilder: (_, index) {
                    var viaC = _viacep.viaCep[index];
                    return Dismissible(
                        onDismissed: (DismissDirection dismissDirection) async {
                          await viaCepBack4AppRepository.remover(viaC.objectId);
                          carregarDados();
                        },
                        key: Key(viaC.objectId),
                        child: Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AtualizarViaCepPage(
                                          id: viaC.objectId)));
                            },
                            title: Text(
                              "Cep: ${viaC.cep}",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ));
                  })),
    );
  }
}
