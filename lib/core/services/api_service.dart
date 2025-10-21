// lib/api_service.dart
import 'package:dio/dio.dart';
import '../utils/constants.dart';
import '../../features/home/models/product_model.dart';

class ApiService {
  final Dio _dio;
  String? _accessToken;
  String? _refreshToken;

  ApiService() : _dio = Dio() {
    // Interceptor pour gérer JWT et refresh automatique
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Ajouter l'access token si disponible
          if (_accessToken != null) {
            options.headers['Authorization'] = 'Bearer $_accessToken';
          }
          return handler.next(options);
        },
        onError: (DioError error, handler) async {
          // Si 401 Unauthorized, essayer de refresh
          if (error.response?.statusCode == 401 && _refreshToken != null) {
            final success = await _refreshAccessToken();
            if (success) {
              final request = error.requestOptions;
              request.headers['Authorization'] = 'Bearer $_accessToken';
              final response = await _dio.fetch(request);
              return handler.resolve(response);
            }
          }
          return handler.next(error);
        },
      ),
    );
  }

  // Login : récupère access + refresh
  Future<bool> login(String username, String password) async {
    try {
      final response = await _dio.post(
        LOGIN_URL,
        data: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        _accessToken = response.data['access'];
        _refreshToken = response.data['refresh'];
        return true;
      }
    } catch (e) {
      print('Login failed: $e');
    }
    return false;
  }

  // Refresh automatique de l'access token
  Future<bool> _refreshAccessToken() async {
    try {
      final response = await _dio.post(
        '$API_BASE_URL/token/refresh/',
        data: {'refresh': _refreshToken},
      );
      if (response.statusCode == 200) {
        _accessToken = response.data['access'];
        return true;
      }
    } catch (e) {
      print('Refresh token failed: $e');
    }
    return false;
  }

  // 🔹 Renvoie une liste d'objets Product
  Future<List<Product>> getProducts() async {
    try {
      final response = await _dio.get(PRODUCTS_URL);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        // Convertir chaque Map en Product
        return data.map((json) => Product.fromJson(json)).toList();
      }
    } catch (e) {
      print('Failed to load products: $e');
    }
    return [];
  }
}
