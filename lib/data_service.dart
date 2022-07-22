import 'dart:convert';
import 'package:day11/json.dart';
import 'package:http/http.dart' as http;

class Dataservices {
  Future<WeatherResponse> getWeather(String city) async {
    final queryParameter = {
      'q': city,
      'appid': '73795dead5a8cb8e385712da2810574f',
      'units': 'imperial',
    };
    final uri =
        Uri.http('api.openweathermap.org', "/data/2.5/weather", queryParameter);

    final response = await http.get(uri);
    print(response.body);

    final json = jsonDecode(response.body);

    return WeatherResponse.fromJson(json);
  }
}
