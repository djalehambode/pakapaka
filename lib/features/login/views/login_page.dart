import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/login_page_view_model.dart';
import '../../../core/services/api_service.dart';
import 'login_page_components/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(api: ApiService()),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: const Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}
