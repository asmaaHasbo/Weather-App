import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/change_theme_cubit.dart';
import 'package:weather_app/cubits/get_weather_data_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_data_cubit/get_weather_states.dart';
import 'package:weather_app/screens/home_screen.dart';
void main() async {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  WeatherApp();

  @override
  String? status;

  //
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return Builder(
              builder: (context) =>
                  MaterialApp(
                    theme: ThemeData(
                      appBarTheme: AppBarTheme(
                        backgroundColor: getColor(
                            status: BlocProvider
                                .of<GetWeatherCubit>(context)
                                .weatherModule
                                ?.weatherStatus),
                      ),
                    ),
                    debugShowCheckedModeBanner: false,
                    home: HomeScreen(),
                  ),
            );
          },
        ));
  }
}

MaterialColor getColor({required status}) {
  if (status == null) {
    return Colors.blue;
  }
  switch (status?.toLowerCase()) {
    case 'sunny':
      return Colors.amber;
    case 'clear':
      return Colors.green;
    case 'partly cloudy':
      return Colors.lightBlue;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
      return Colors.blueGrey;
    case 'mist':
      return Colors.teal;
    case 'patchy rain possible':
      return Colors.indigo;
    case 'patchy snow possible':
      return Colors.lightBlue;
    case 'patchy sleet possible':
      return Colors.cyan;
    case 'patchy freezing drizzle possible':
      return Colors.blue;
    case 'thundery outbreaks possible':
      return Colors.deepOrange;
    case 'blowing snow':
      return Colors.cyan;
  // Add cases for the remaining day and night conditions
    case 'light rain showers':
      return Colors.lightGreen;
    case 'moderate or heavy rain showers':
      return Colors.indigo;
    case 'light sleet showers':
      return Colors.cyan;
    case 'moderate or heavy sleet showers':
      return Colors.blue;
    case 'thundery outbreaks in nearby':
      return Colors.yellow;
  // Add cases for any other conditions as needed
    default:
      return Colors.blue;
  }
}
//
// String ? status ;
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather_app/cubits/get_weather_data_cubit/get_weather_cubit.dart';
// import 'package:weather_app/cubits/get_weather_data_cubit/get_weather_states.dart';
// import 'package:weather_app/screens/home_screen.dart';
//
// void main() {
//   runApp(WeatherApp());
// }
//
// class WeatherApp extends StatelessWidget {
//   WeatherApp();
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => GetWeatherCubit(),
//       child: customMaterialColor(),
//     );
//   }
// }
//
// class customMaterialColor extends StatelessWidget {
//   const customMaterialColor({
//     super.key,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<GetWeatherCubit, WeatherState >(
//       builder: (context, state) {
//         if(state is WeatherChangeThemeState ){
//           return MaterialApp(
//             theme: ThemeData(
//               appBarTheme: AppBarTheme(backgroundColor:
//               BlocProvider.of<GetWeatherCubit>(context).changeWeatherTheme(BlocProvider.of<GetWeatherCubit>(context).weatherModule?.weatherStatus)
//               ),
//             ),
//
//           );
//         }
//         else{
//           return  MaterialApp(
//             theme: ThemeData(
//                 appBarTheme: AppBarTheme(
//                     backgroundColor: Colors.lime
//                 )
//             ),
//             debugShowCheckedModeBanner: false,
//             home: HomeScreen(),
//           );
//         }
//
//       },
//     );
//   }
// }
//
//
// MaterialColor getColor(String ? status) {
//   if( status == null ){
//     return Colors.blue ;
//   }
//   switch (status?.toLowerCase()) {
//     case 'sunny':
//       return Colors.amber;
//     case 'clear':
//       return Colors.green;
//     case 'partly cloudy':
//       return Colors.lightBlue;
//     case 'cloudy':
//       return Colors.grey;
//     case 'overcast':
//       return Colors.blueGrey;
//     case 'mist':
//       return Colors.teal;
//     case 'patchy rain possible':
//       return Colors.indigo;
//     case 'patchy snow possible':
//       return Colors.lightBlue;
//     case 'patchy sleet possible':
//       return Colors.cyan;
//     case 'patchy freezing drizzle possible':
//       return Colors.blue;
//     case 'thundery outbreaks possible':
//       return Colors.deepOrange;
//     case 'blowing snow':
//       return Colors.cyan;
//   // Add cases for the remaining day and night conditions
//     case 'light rain showers':
//       return Colors.lightGreen;
//     case 'moderate or heavy rain showers':
//       return Colors.indigo;
//     case 'light sleet showers':
//       return Colors.cyan;
//     case 'moderate or heavy sleet showers':
//       return Colors.blue;
//     case 'thundery outbreaks in nearby':
//       return Colors.yellow;
//   // Add cases for any other conditions as needed
//     default:
//       return Colors.blue;
//   }
// }

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CounterApp(),
//     );
//   }
// }
//
// class CounterApp extends StatefulWidget {
//   @override
//   _CounterAppState createState() => _CounterAppState();
// }
//
// class _CounterAppState extends State<CounterApp> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Counter App'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Counter:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
