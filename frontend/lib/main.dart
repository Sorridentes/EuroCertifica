import 'package:flutter/material.dart';
import 'package:frontend/features/auth/presentation/controllers/auth_provider.dart';
import 'package:frontend/features/auth/presentation/pages/login_page.dart';
import 'package:provider/provider.dart';
import 'core/di/service_locator.dart' as di;

void main() {
  di.init(); // Inicializa o GetIt
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => di.sl<AuthProvider>())],
      child: MaterialApp(
        title: 'EuroCertifica',
        home:
            const LoginPage(), // Sua tela de login que chama authProvider.signIn()
      ),
    );
  }
}
