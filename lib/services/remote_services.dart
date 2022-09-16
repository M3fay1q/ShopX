import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopx/models/product_model.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<ProductModel>?> fetchProducts() async {
    var response = await client.get(Uri.parse(
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    if (response.statusCode == 200) {
      //Deserialize the json in http library
      var jsonData = jsonDecode(response.body);
      final List<ProductModel> result =
          (jsonData as List).map((e) => ProductModel.fromJson(e)).toList();
      return result;
    } else {
      return null;
    }
  }
}
