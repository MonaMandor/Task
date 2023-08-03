import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/products.dart';

class ProductApi {
  static Future<List<Products>> gitAllProduct() async {
    final http.Response response = (await http
        .get(Uri.parse("https://fakestoreapi.com/products"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    })) as http.Response;
    print(response.body);
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Products>((json) => Products.fromJson(json)).toList();
    } else {
      throw Exception('Failed to git all product');
    }
  }
}
