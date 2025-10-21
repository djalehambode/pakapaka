import 'package:flutter/foundation.dart';
import '../../../core/services/api_service.dart';

class HomeViewModel extends ChangeNotifier {
  final ApiService api;

  List<dynamic> _products = [];
  bool _loading = true;
  String? _error;

  List<dynamic> get products => _products;
  bool get loading => _loading;
  String? get error => _error;

  HomeViewModel({required this.api}) {
    loadProducts();
  }

  Future<void> loadProducts() async {
    _setLoading(true);
    _setError(null);
    try {
      final data = await api.getProducts();
      _products = data;
    } catch (e) {
      _setError("Erreur de chargement: $e");
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void _setError(String? message) {
    _error = message;
    notifyListeners();
  }
}
