import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_data_cubit/get_weather_cubit.dart';
import 'package:weather_app/module/weather_module.dart';

import '../main.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModule = BlocProvider.of<GetWeatherCubit>(context).weatherModule!;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [getColor(
              status: BlocProvider
                  .of<GetWeatherCubit>(context)
                  .weatherModule
                  ?.weatherStatus)  ,   const Color(0xFFE8F5E9) ],
        ),
      ),
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //---------------------- city Name ----------------
          Text(
              weatherModule.cityName
            ,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),

          //---------------------- time ----------------
          Text(
            'updated at : ${weatherModule.date } : ${weatherModule.date}',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),

          //---------------------- temperature ----------------
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///------------------- image --------------------
                Image(image: NetworkImage('https:${weatherModule.imgUrl}'),
                width: 100,
                ),
                ///--------------------- main degree -------------------
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                   weatherModule.tempDeg as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),

                ///-------------------------- max & min temp
                Column(
                  children: [
                    Text(
                      "maxTemp: ${weatherModule.maxTemp}" ,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'minTemp: ${weatherModule.minTemp}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          //---------------------- status ----------------
          Text(
           weatherModule.weatherStatus,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ],
      ),
    );
  }
}
