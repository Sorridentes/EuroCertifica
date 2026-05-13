import 'package:flutter/material.dart';
import 'package:frontend/features/auth/data/repositories/auth_repositoty.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository repository;

  String? _token;
  bool _isLoading = false;

  AuthProvider({required this.repository});

  String? get token => _token;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _token != null;

  Future<bool> signIn(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    final receivedToken = await repository.login(email, password);

    if (receivedToken != null) {
      _token = receivedToken;

      // Salva diretamente aqui no SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', _token!);

      _isLoading = false;
      notifyListeners();
      return true;
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }

  // Função para limpar o token no logout
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    _token = null;
    notifyListeners();
  }
}
