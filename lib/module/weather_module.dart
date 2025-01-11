// class WeatherModule {
//   String cityName;
//   String weatherStatus;
//   String imgUrl;
//   DateTime date;
//   double tempDeg;
//   double maxTemp;
//   double minTemp;
//
//   WeatherModule({
//     required this.cityName,
//     required this.imgUrl,
//     required this.date,
//     required this.tempDeg,
//     required this.maxTemp,
//     required this.minTemp,
//     required this.weatherStatus,
//   });
//   factory WeatherModule.fromJson(json) {
//     return WeatherModule(
//       cityName: json["location"]['name'],
//       imgUrl: json["current"]["condition"]["icon"],
//       date: json['current']['last_updated'],
//       tempDeg: json['avgtemp_c'],
//       maxTemp: json['maxtemp_c'],
//       minTemp: json['mintemp_c'],
//       weatherStatus: json['condition']['text'],
//     );
//   }
// }

import 'package:flutter/material.dart';

class WeatherModel {
  String cityName;
  String imgUrl;
  DateTime date;
  double tempDeg;
  double maxTemp;
  double minTemp;
  String weatherStatus;

  WeatherModel(
      {
        required this.cityName,
        required this.date,
      required this.tempDeg,
      required this.imgUrl,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStatus,});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
      date: DateTime.parse(data['current']['last_updated']),
      tempDeg: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      weatherStatus: jsonData['condition']['text'],
      imgUrl: jsonData['condition']['icon'],
      cityName: data["location"]['name'],
    );
  }

  // @override
  // String toString() {
  //   return 'tem = $tempDeg  minTemp = $minTemp  date = $date';
  // }

  String getImage() {
    if (weatherStatus == 'Sunny' ||
        weatherStatus == 'Clear' ||
        weatherStatus == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (weatherStatus == 'Blizzard' ||
        weatherStatus == 'Patchy snow possible' ||
        weatherStatus == 'Patchy sleet possible' ||
        weatherStatus == 'Patchy freezing drizzle possible' ||
        weatherStatus == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (weatherStatus == 'Freezing fog' ||
        weatherStatus == 'Fog' ||
        weatherStatus == 'Heavy Cloud' ||
        weatherStatus == 'Mist' ||
        weatherStatus == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (weatherStatus == 'Patchy rain possible' ||
        weatherStatus == 'Heavy Rain' ||
        weatherStatus == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (weatherStatus == 'Thundery outbreaks possible' ||
        weatherStatus == 'Moderate or heavy snow with thunder' ||
        weatherStatus == 'Patchy light snow with thunder' ||
        weatherStatus == 'Moderate or heavy rain with thunder' ||
        weatherStatus == 'Patchy light rain with thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weatherStatus == 'Sunny' ||
        weatherStatus == 'Clear' ||
        weatherStatus == 'partly cloudy') {
      return Colors.orange;
    } else if (weatherStatus == 'Blizzard' ||
        weatherStatus == 'Patchy snow possible' ||
        weatherStatus == 'Patchy sleet possible' ||
        weatherStatus == 'Patchy freezing drizzle possible' ||
        weatherStatus == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherStatus == 'Freezing fog' ||
        weatherStatus == 'Fog' ||
        weatherStatus == 'Heavy Cloud' ||
        weatherStatus == 'Mist' ||
        weatherStatus == 'Fog') {
      return Colors.blueGrey;
    } else if (weatherStatus == 'Patchy rain possible' ||
        weatherStatus == 'Heavy Rain' ||
        weatherStatus == 'Showers	') {
      return Colors.blue;
    } else if (weatherStatus == 'Thundery outbreaks possible' ||
        weatherStatus == 'Moderate or heavy snow with thunder' ||
        weatherStatus == 'Patchy light snow with thunder' ||
        weatherStatus == 'Moderate or heavy rain with thunder' ||
        weatherStatus == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
