import 'package:flutter/material.dart';
import 'package:via_cep_back4app/via_cep_home_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const ViaCepHomePage());
}
