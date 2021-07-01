import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    var urll = Uri.parse(url);
    http.Response response = await http.get(urll);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
