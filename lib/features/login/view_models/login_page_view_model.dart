import 'package:flutter/foundation.dart';
import '../../../core/services/api_service.dart';

class LoginViewModel extends ChangeNotifier {
  final ApiService api;

  bool _loading = false;
  String? _error;

  bool get loading => _loading;
  String? get error => _error;

  LoginViewModel({required this.api});

  Future<bool> login(String username, String password) async {
    _setLoading(true);
    _setError(null);

    final success = await api.login(username, password);

    _setLoading(false);
    if (!success) _setError("Identifiants invalides");

    return success;
  }

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void _setError(String? value) {
    _error = value;
    notifyListeners();
  }
}
