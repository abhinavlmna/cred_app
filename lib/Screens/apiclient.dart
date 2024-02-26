import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl =
    'https://fad1-2401-4900-1cdc-19ad-5b8e-b965-a33d-e12.ngrok-free.app';

class Apiclient {
  var client = http.Client();
  Future<dynamic> get(String route) async {
    var url = Uri.parse(baseUrl + route);
    var response = await client.get(url, headers: {});
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print('failed');
    }
  }

  Future<dynamic> post(String route, dynamic data) async {
    var url = Uri.parse(baseUrl + route);
    try {
      var response = await client.post(
        url,
        body: data,
        headers: {},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        print('failed');
      }
    } catch (err) {
      print(err);
    }
  }

  Future<dynamic> put(String api) async {}
  Future<dynamic> delete(String api) async {}
}
