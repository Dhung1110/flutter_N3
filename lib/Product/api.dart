import 'package:dio/dio.dart';
import 'product.dart';

class API {
  Future<List<Product>> getAllProducts() async {
    var dio = Dio();
    var response = await dio.get('https://fakestoreapi.com/products');

    if (response.statusCode == 200) {
      List list = response.data;
      return list.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception("Lỗi API");
    }
  }
}
