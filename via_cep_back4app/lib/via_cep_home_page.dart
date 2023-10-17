import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:via_cep_back4app/pages/via_cep_page.dart';

//stl
class ViaCepHomePage extends StatelessWidget {
  const ViaCepHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 12, 94, 16)),
            useMaterial3: true,
            textTheme: GoogleFonts.robotoMonoTextTheme()),
        home: const ViaCepPage());
  }
}
