import 'dart:convert';
import 'dart:io';

// import 'package:cloudinary_flutter/cloudinary_object.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prjct223_d1_24/constants/handling_error.dart';
import 'package:prjct223_d1_24/constants/universal_var.dart';
import 'package:prjct223_d1_24/constants/utils.dart';
import 'package:prjct223_d1_24/models/products.dart';
import 'package:http/http.dart' as http;
import 'package:prjct223_d1_24/provider/user_provider.dart';
import 'package:provider/provider.dart';

class AdminServices {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudinary = CloudinaryPublic('du3xhcuem', 'ycrmnkqi');
      List<String> imageUrls = [];
      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary
            .uploadFile(CloudinaryFile.fromFile(images[i].path, folder: name));
        imageUrls.add(res.secureUrl);
      }

      Product product = Product(
          name: name,
          description: description,
          quantity: quantity,
          images: imageUrls,
          category: category,
          price: price);
      http.Response res = await http.post(
        Uri.parse('$uri/admin/add-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: product.toJson(),
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSucces: () {
            showSnackBar(context, "Product Added Succesfully!");
            Navigator.pop(context);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //get all product
  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/admin/get-products'), headers: {
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

//delete produk
  void deleteProduct({
    required BuildContext context,
    required Product product,
    required VoidCallback onSucces,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id,
        }),
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSucces: () {
            onSucces();
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
