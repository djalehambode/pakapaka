import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_models/login_page_view_model.dart';
import '../../../home/views/home_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController usernameCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LoginViewModel>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.lock_outline, size: 100, color: Colors.blueAccent),
        const SizedBox(height: 32),
        _buildUsernameField(),
        const SizedBox(height: 16),
        _buildPasswordField(),
        const SizedBox(height: 16),
        if (vm.error != null) ...[
          Text(vm.error!, style: const TextStyle(color: Colors.red)),
          const SizedBox(height: 16),
        ],
        _buildLoginButton(vm),
      ],
    );
  }

  Widget _buildUsernameField() {
    return TextField(
      controller: usernameCtrl,
      decoration: InputDecoration(
        labelText: "Nom d'utilisateur",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        prefixIcon: const Icon(Icons.person),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: passwordCtrl,
      decoration: InputDecoration(
        labelText: "Mot de passe",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        prefixIcon: const Icon(Icons.lock),
      ),
      obscureText: true,
    );
  }

  Widget _buildLoginButton(LoginViewModel vm) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: vm.loading ? null : _onLoginPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: vm.loading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : const Text(
                "Se connecter",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
      ),
    );
  }

  void _onLoginPressed() async {
    final vm = context.read<LoginViewModel>();
    final success = await vm.login(
      usernameCtrl.text.trim(),
      passwordCtrl.text.trim(),
    );
    if (success) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => HomePage(api: vm.api)),
      );
    }
  }
}
