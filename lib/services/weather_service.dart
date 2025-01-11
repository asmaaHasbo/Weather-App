import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/module/weather_module.dart';

void main() async {

  await WeatherServices().getWeatherInfo('cairo');
}

class WeatherServices {
  Dio dio = Dio();
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'c81da1f1ae0d4088a51120524241910';

  Future<WeatherModel> getWeatherInfo(String cityName) async {
    try {
      Response response = await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherApiInfos = WeatherModel.fromJson(response.data);
      print('response is success');
      return weatherApiInfos;
    } on DioException catch (e) {
      String errorMsg = e.response?.data["error"]["message"] ?? 'opps there is an error , try later';
      print('dio exception');
      print(errorMsg);
      throw Exception(errorMsg) ;
    }
    catch(e){
      print(e.toString());
      throw Exception('try later');
    }
  }
}
