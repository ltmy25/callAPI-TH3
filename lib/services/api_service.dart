import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  // Thay đổi sang chủ đề Điện thoại thông minh (Smartphones) từ DummyJSON
  static const String apiUrl = 'https://dummyjson.com/products/category/smartphones';

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // DummyJSON trả về dữ liệu nằm trong trường "products"
        final Map<String, dynamic> data = jsonDecode(response.body);
        List<dynamic> productsJson = data['products'];
        
        return productsJson
            .map((item) => Product.fromJson(item))
            .toList();
      } else {
        throw Exception('Không thể tải dữ liệu từ máy chủ');
      }
    } catch (e) {
      // Bắt lỗi ngoại lệ và ném ra thông báo thân thiện cho UI
      throw Exception('Lỗi kết nối mạng: Vui lòng kiểm tra Wi-Fi/4G');
    }
  }
}
