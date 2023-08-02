import 'package:http/http.dart' as http;

class CategoryApi{
  static Future getCategories(){
    final url = Uri.parse("http://localhost:3000/categories");
    return http.get(url);
  }
}