import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:WeatherPage()
    );
  }
}

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  String areaName = ''; //地域名
  String wether = ''; //天気
  double temperature = 0; //温度
  double temperatureMax = 0; //最高気温
  double temperatureMin = 0; //最低気温
  int humidity = 0; //湿度

  TextEditingController _controller = TextEditingController();

  Future<void> searchWeather(String area)async{
    final response = await http.get(
      Uri.parse('https://api.openweathermap.org/data/2.5/weather?appid=8701235f083afe1cd2a2802d8197fcc4&lang=ja&units=metric&q=$area')
    );
    if(response.statusCode != 200){
      //debugPrint('${response.statusCode}');
      return;
    }

    //debugPrint(response.body);

    //JSONからMap型にデコード
    final Map<String,dynamic> body = json.decode(response.body);
    final Map<String,dynamic> main =(body['main'] ?? {});
    //debugPrint('$main');

    setState(() {
      areaName = body['name'];                   //地域名の更新
      wether = (body['weather'][0]['description'] ?? '') as String; //天気の更新
      temperature = (main['temp'] ?? 0.0) as double;                //温度
      temperatureMax = (main['temp_max'] ?? 0.0) as double;         //最高気温
      temperatureMin = (main['temp_min'] ?? 0.0) as double;         //最低温度
      humidity = (main['humidity'] ?? 0) as int;               //湿度
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: TextField(
          controller: _controller,
          onChanged: (value){
            searchWeather(value);
          },
        ),
      ),
      body: ListView(
        children: [
          ListTile(title: Text('地域'),subtitle: Text(areaName),),
          ListTile(title: Text('天気'),subtitle: Text(wether),),
          ListTile(title: Text('温度'),subtitle: Text(temperature.toString()),),
          ListTile(title: Text('最高気温'),subtitle: Text(temperatureMax.toString()),),
          ListTile(title: Text('最低気温'),subtitle: Text(temperatureMin.toString())),
          ListTile(title: Text('湿度'),subtitle: Text(humidity.toString())),
        ],
      ),
    );
  }
}
