import 'package:frontend/core/network/dio_client.dart';

class AuthRepository {
  final DioClient dioClient;

  AuthRepository({required this.dioClient});

  Future<String?> login(String email, String password) async {
    try {
      final response = await dioClient.dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        // O backend agora retorna o token dentro do DTO de resposta
        return response.data['token'];
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
