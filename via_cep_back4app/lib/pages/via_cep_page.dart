import 'package:flutter/material.dart';
import 'package:via_cep_back4app/pages/Lista_cep_page.dart';
import 'package:via_cep_back4app/pages/consulta_via_cep_page.dart';

class ViaCepPage extends StatefulWidget {
  const ViaCepPage({super.key});

  @override
  State<ViaCepPage> createState() => _ViaCepPageState();
}

class _ViaCepPageState extends State<ViaCepPage> {
  PageController pageController = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "VIA CEP",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 12, 83, 35),
      ),
      body: Column(children: [
        Expanded(
            child: PageView(
          controller: pageController,
          onPageChanged: (value) {
            setState(() {
              posicaoPagina = value;
            });
          },
          children: const [ListaCepPage(), ConsultaViaCepPage()],
        )),
        BottomNavigationBar(
            onTap: (value) {
              pageController.jumpToPage(value);
            },
            currentIndex: posicaoPagina,
            items: const [
              BottomNavigationBarItem(
                  label: "Lista", icon: Icon(Icons.view_list)),
              BottomNavigationBarItem(
                  label: "CEP", icon: Icon(Icons.streetview)),
            ])
      ]),
    ));
  }
}
