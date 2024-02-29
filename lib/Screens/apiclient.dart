import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl =
    'https://04ba-2409-4073-4e1d-4be6-48cb-9f1-7743-180a.ngrok-free.app';

class Apiclient {
  var client = http.Client();
  Future<dynamic> get(String route) async {
    // var url = Uri.parse(baseUrl + route);
    // var response = await client.get(url, headers: {});
    // if (response.statusCode == 200) {
    //   return response.body;
    // } else {
    //   print('failed');
    // }
    var response = [
      {
        "id": 1,
        "name": "zack",
        "phone": "9526925448",
        "age": "21",
        "place": "vlmna",
        "address": "kochi",
        "createdAt": "2024-02-23T10:34:25.153Z",
        "updatedAt": "2024-02-23T10:34:25.153Z"
      },
      {
        "id": 2,
        "name": "zack",
        "phone": "9526925448",
        "age": "21",
        "place": "vlmna",
        "address": "kochi",
        "createdAt": "2024-02-23T10:35:22.503Z",
        "updatedAt": "2024-02-23T10:35:22.503Z"
      }
    ];
    return response;
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
