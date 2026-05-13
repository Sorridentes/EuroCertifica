import 'package:dio/dio.dart';
import 'auth_interceptor.dart';

class DioClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:8080/api',
      connectTimeout: const Duration(seconds: 5),
    ),
  );

  DioClient() {
    dio.interceptors.add(AuthInterceptor()); // Adiciona o interceptor aqui
  }
}
