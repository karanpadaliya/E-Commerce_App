import 'dart:convert';

import 'package:demo/model/productModel.dart';
import 'package:http/http.dart' as http;

List<ProductModel> productList = [];

Future<List<ProductModel>> getData() async {
  final res = await http.get(Uri.parse("https://fakestoreapi.com/products"));
  var data = jsonDecode(res.body.toString());

  if (res.statusCode == 200) {
    for (Map<String, dynamic> index in data) {
      productList.add(ProductModel.fromJson(index));
    }
  } else {
    print("res => Faild");
  }
  return productList;
}
