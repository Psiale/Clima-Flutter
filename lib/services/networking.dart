import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HTTPRequest {
  HTTPRequest(this.url);
  final String url;
  fetchWeather() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);

      return jsonResponse;
    } else {
      return response.statusCode;
    }
  }
}
