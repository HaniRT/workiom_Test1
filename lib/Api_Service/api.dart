import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String uri}) async {
    http.Response response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> get2({required String uri}) async {
    final response = await Dio().get(uri);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }





  Future<dynamic> post(
      {required String url, @required dynamic body, dynamic parameters}) async {
    final response =
    await Dio().post(url, data: body, queryParameters: parameters);
    if (response.statusCode == 200) {
      final data = response.data['result']['tenantId'];
      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }
}
