import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HTTPRequest {
  HTTPRequest(this.url);
  final String url;
  fetchWeather(lat, lon) async {
    http.Response response = await http.get(
        url);
    print(lat);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      double temperature = jsonResponse['main']['temp'];
      int condition = jsonResponse['weather'][0]['id'];
      String cityName = jsonResponse['name'];
      print(temperature);
      print(condition);
      print(cityName);
      return jsonResponse;
    }
    return response.body;
  }
}
