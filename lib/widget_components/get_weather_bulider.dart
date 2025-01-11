// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:weather_app/screens/search_view.dart';
// import 'package:weather_app/widget_components/weather_body.dart';
//
// import '../module/weather_module.dart';
// import '../services/weather_service.dart';
//
// class GetWeatherBulider extends StatefulWidget {
//   GetWeatherBulider({Key? key }) : super(key: key);
//
//   @override
//   State<GetWeatherBulider> createState() => _GetWeatherBuliderState();
// }
//
// class _GetWeatherBuliderState extends State<GetWeatherBulider> {
//   @override
//   var future ;
//
//   @override
//   void initState() {
//     // future = weatherModule;
//   }
//
//   Widget build(BuildContext context) {
//     return   FutureBuilder <WeatherModule> (
//       future: future,
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return const Center(
//             child: Text('there are an error'),
//           );
//         }
//         else if (snapshot.hasData) {
//           return ;
//         }
//         else{
//           return const Center(child: CircularProgressIndicator(),) ;
//         }
//       },
//     ) ;
//   }
// }
