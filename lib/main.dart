import 'package:day11/data_service.dart';
import 'package:day11/json.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();
  final _dataServices = Dataservices();
  WeatherResponse? _response;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Builder(builder: (_) {
          if (_response != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Image.network(_response!.iconurl),
                  Text(
                    'temperature in \n ' +
                        _controller.text.toUpperCase() +
                        '\n is ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${_response!.tempInfo.temperature}°',
                    style: const TextStyle(fontSize: 40),
                  ),
                  SizedBox(height: 3),
                  Text(_response!.weatherInfo.description),
                ],
              ),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(labelText: "City"),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: search,
                  child: const Text(
                    'Search',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          }
        }),
      ),
    );
  }

  void search() async {
    final response = await _dataServices.getWeather(_controller.text);
    setState(() => _response = response);
  }
}
