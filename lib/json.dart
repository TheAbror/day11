// {
//   "weather": [
//     {
//       "id": 800,
//       "main": "Clear",
//       "description": "clear sky",
//       "icon": "01d"
//     }
//   ],
//   "main": {
//     "temp": 282.55,
//     "feels_like": 281.86,
//     "temp_min": 280.37,
//     "temp_max": 284.26,
//     "pressure": 1023,
//     "humidity": 100
//   },

//   "timezone": -25200,
//   "id": 420006353,
//   "name": "Mountain View",
//   "cod": 200
//   }

class WeatherInfo {
  WeatherInfo({required this.description, required this.icon});
  final String description;
  final String icon;

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return WeatherInfo(description: description, icon: icon);
  }
}

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

class TemperatureInfo {
  TemperatureInfo({required this.temperature});

  final double temperature;

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature);
  }
}
