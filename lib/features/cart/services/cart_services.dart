import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prjct223_d1_24/constants/handling_error.dart';
import 'package:prjct223_d1_24/constants/universal_var.dart';
import 'package:prjct223_d1_24/constants/utils.dart';
import 'package:prjct223_d1_24/models/products.dart';
import 'package:prjct223_d1_24/models/user.dart';
import 'package:prjct223_d1_24/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CartServices {
  void removeFromCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.delete(
        Uri.parse('$uri/api/remove-from-cart/${product.id}'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSucces: () {
          User user = userProvider.user.copyWith(
            cart: jsonDecode(res.body)['cart'],
          );
          userProvider.setUserFromModel(user);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
