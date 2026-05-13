import 'package:flutter/material.dart';
import 'package:frontend/features/auth/presentation/controllers/auth_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/login_input.dart';
import '../../../../core/constants/colors.dart';

class LoginPage extends StatefulWidget {
  final bool isManager; // Define se é Gestor ou Colaborador

  const LoginPage({super.key, this.isManager = false});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.85,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderBlue, width: 2),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "EUROCERTIFICA",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.isManager
                    ? "LOGIN PARA GESTORES"
                    : "Bem-vindo, a área do\ncolaborador!",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 40),
              LoginInput(hint: "E-mail/User", controller: _userController),
              LoginInput(
                hint: "Password",
                controller: _passwordController,
                isPassword: true,
              ),

              TextButton(
                onPressed: () {}, // Esqueci minha senha
                child: const Text(
                  "Esqueceu sua senha?",
                  style: TextStyle(color: AppColors.primaryBlue),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: 200,
                height: 45,
                child: ElevatedButton(
                  onPressed: authProvider.isLoading
                      ? null
                      : () async {
                          final success = await authProvider.signIn(
                            _userController.text,
                            _passwordController.text,
                          );
                          if (success) {
                            // Navegação baseada no sucesso do banco Oracle
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Credenciais inválidas"),
                              ),
                            );
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: authProvider.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "Entrar",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                ),
              ),

              const Spacer(),

              TextButton(
                onPressed: () {},
                child: const Text(
                  "Políticas de Privacidade",
                  style: TextStyle(color: AppColors.primaryBlue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
