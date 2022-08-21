import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      String stringResponse = response.body;
      return jsonDecode(stringResponse);
    } else {
      print(response.statusCode);
    }
  }
}
