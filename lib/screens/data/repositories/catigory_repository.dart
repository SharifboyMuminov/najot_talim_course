import '../moduls/network_response.dart';
import '../network/api_preovider.dart';

class CategoryRepository {
  Future<NetworRespons> getAllCategoriy() => ApiPreovider.fitchCategorys();

  Future<NetworRespons> getInfoCategory(int id) =>
      ApiPreovider.fitchCategory(id);

  Future<NetworRespons> getAllProduct() => ApiPreovider.fitchAllProduct();
}
