import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_data_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_data_cubit/get_weather_states.dart';
import 'package:weather_app/screens/search_view.dart';
import 'package:weather_app/widget_components/no_weather_body.dart';
import 'package:weather_app/widget_components/weather_body.dart';

class HomeScreen extends StatelessWidget {
  bool isAnCity = false;

  @override
  Widget build(BuildContext context) {
    //-----------  لو مختار مدينيه هيرجع له معلومات لو لسه هيرجع no weather
    return Scaffold(

      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme,
        title: const Text(
          'Weather App',
          // style: TextStyle(color: Colors.white),
        ),
        actions: [
          //----------------- ايقونه السرش ---------------------
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SearchView();
                }),
              );
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return   WeatherBody();
          } else {
            return const Center(
                child: Text(
              ' opss there are an error ',
                  style: TextStyle(color: Colors.red,fontSize: 20),
            ));
          }
        },
      ),

    );
  }
}
