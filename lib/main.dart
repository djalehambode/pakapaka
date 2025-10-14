import 'package:flutter/material.dart';
import 'package:pakapaka/api_service.dart';
import 'package:pakapaka/product_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo DRF Auth',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ApiService api = ApiService();
  final TextEditingController usernameCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  bool loading = false;
  String? error;

  void _login() async {
    setState(() {
      loading = true;
      error = null;
    });

    final success = await api.login(usernameCtrl.text, passwordCtrl.text);

    setState(() {
      loading = false;
    });

    if (success) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ProductsPage(api: api)),
      );
    } else {
      setState(() {
        error = "Identifiants invalides";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Connexion")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameCtrl,
              decoration: const InputDecoration(labelText: "Nom d'utilisateur"),
            ),
            TextField(
              controller: passwordCtrl,
              decoration: const InputDecoration(labelText: "Mot de passe"),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            if (error != null)
              Text(error!, style: const TextStyle(color: Colors.red)),
            ElevatedButton(
              onPressed: loading ? null : _login,
              child: loading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Se connecter"),
            ),
          ],
        ),
      ),
    );
  }
}
