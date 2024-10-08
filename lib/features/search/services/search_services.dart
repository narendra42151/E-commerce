import 'dart:convert';

import 'package:amazzon/constants/error_handelling.dart';
import 'package:amazzon/constants/global_variable.dart';
import 'package:amazzon/constants/utils.dart';
import 'package:amazzon/model/product.dart';
import 'package:amazzon/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class SearchServices {
  Future<List<Product>> fetchSearchedproduct(
      {required BuildContext context, required String searchQuary}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res = await http.get(
          Uri.parse('$uri/api/products/search/$searchQuary'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token,
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              productList.add(
                Product.fromJson(
                  jsonEncode(
                    jsonDecode(res.body)[i],
                  ),
                ),
              );
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }

    return productList;
  }
}
