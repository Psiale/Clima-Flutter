import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HTTPRequest {
  final String apiKey = '55b9e2fc241864ad1805c87262e98f50';
  Future<String> fetchWeather(var location) async {
    http.Response response = await http.get(
        "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey");
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body)["weather"];
      print(jsonResponse);
      return jsonResponse;
    }
    return response.body;
  }
}
