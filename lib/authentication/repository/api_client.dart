


import 'dart:convert';

import 'package:cabinet_assistant/utils/app_constants.dart';
import 'package:http/http.dart';

class ApiClient{
  dynamic post(String path,Map<dynamic, dynamic> payload) async {
    final client = Client();
    final response = await client.post(
      Uri.parse('${ApiConstants.baseUrl}$path'),
      body: json.encode(payload),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200 || response.statusCode ==201) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}