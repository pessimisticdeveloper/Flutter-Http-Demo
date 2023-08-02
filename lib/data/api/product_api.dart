import 'package:http/http.dart' as http;

class ProductApi {
  static Future getProducts() {
    final url = Uri.parse("http://localhost:3000/products");
    return http.get(url);
  }

  static Future getProductsByCategoryId(int categoryId) {
    final url =
        Uri.parse("http://localhost:3000/products?categoryId=$categoryId");
    return http.get(url);
  }
}
