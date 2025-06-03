import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;

import '../core/env_helper.dart';
import '../model _class/get_home_area_model.dart';

class ApiService {
  
static Future<GetHomeAreaModel?> viewHomePage() async {
  final url = Uri.parse('${Env.baseUrl}view-homepage?storeid=${Env.id}'); 
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return GetHomeAreaModel.fromJson(data); 
    } else {
      throw Exception('Failed with status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to fetch homepage: $e'); 
  }
}

}
