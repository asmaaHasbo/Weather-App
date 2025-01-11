import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_data_cubit/get_weather_states.dart';
import 'package:weather_app/module/weather_module.dart';

import '../../main.dart';
import '../../services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());

   WeatherModel ? weatherModule ;
  getWeatherData({required String citeName}) async {
    try
    {
      weatherModule = await WeatherServices().getWeatherInfo(citeName);
      emit(WeatherLoadedState());

    }
    on Exception catch (e)
    {
      print(e.toString());
      emit(WeatherFailureState(errorMsg: e.toString()));
    }
  }


  // weatherThemeChang(status){
  //   getColor(status: status);
  //   emit(WeatherThemeChangeState());
  // }

}
