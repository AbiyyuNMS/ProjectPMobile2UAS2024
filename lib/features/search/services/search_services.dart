import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prjct223_d1_24/constants/handling_error.dart';
import 'package:prjct223_d1_24/constants/universal_var.dart';
import 'package:prjct223_d1_24/constants/utils.dart';
import 'package:prjct223_d1_24/models/products.dart';
import 'package:prjct223_d1_24/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SearchServices{
  Future<List<Product>> fetchSearchedProducts(
      {required BuildContext context, required String searchQuery}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res = await http
          .get(Uri.parse('$uri/api/products/search/$searchQuery'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });
      httpErrorHandle(
        response: res,
        context: context,
        onSucces: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  (jsonDecode(res.body)[i]),
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }
}