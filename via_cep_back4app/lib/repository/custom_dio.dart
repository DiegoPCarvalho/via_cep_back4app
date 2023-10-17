import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:via_cep_back4app/repository/dio_interceptor.dart';

class CustomDio {
  final _dio = Dio();

  Dio get dio => _dio;

  CustomDio() {
    _dio.options.headers["Content-Type"] = dotenv.get("B4ACONTENTTYPE");
    _dio.options.baseUrl = dotenv.get("BASEURL");
    _dio.interceptors.add(DioInterceptors());
  }
}
