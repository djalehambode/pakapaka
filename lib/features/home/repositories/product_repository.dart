import '../../../core/services/api_service.dart';
import '../models/product_model.dart';

class ProductRepository {
  final ApiService api;

  ProductRepository(this.api);

  Future<List<Product>> fetchAll() async {
    // ici tu pourrais ajouter de la logique métier
    return await api.getProducts();
  }
}
