# day11
<img width="1440" alt="image" src="https://user-images.githubusercontent.com/60324587/180370200-7f62960e-6917-4b1d-94b5-dfc379c71a57.png">

1. What did I learn?
```
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

```
### get info from API
```
class WeatherResponse {
  WeatherResponse(
      {required this.cityName,
      required this.tempInfo,
      required this.weatherInfo});
  final String cityName;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;

  String get iconurl {
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final weatherResponse = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherResponse);
    return WeatherResponse(
        cityName: cityName, tempInfo: tempInfo, weatherInfo: weatherInfo);
  }
}
```
### to work with *factory*










