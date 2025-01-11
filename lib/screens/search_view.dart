// import 'package:flutter/material.dart';
// //------------------------ عشان ال  SearchDelegate الكلاس دا نوعه apstract ومشينفعش اعمل منه anonymous opject عشان كدا بعمل كلاس يورث من الكلاس دا واقدر اعمل مننه اوبجكت وكدا
//
// class MySearchDelegate extends SearchDelegate {
//   //--------------- دول الدوال اللي لازم اعملها لما ورثت من  ال apstract class
//   @override
//   // --- داله بترجع ليست من  ال widget زي ال asction اللي موجوده في app bar
//   //--------------- لما اضغط عليها هيقفل ليا السرش ا ******
//
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(onPressed: () {}, icon: Icon(Icons.close)),
//     ];
//   }
//
//   // زي ال leading  اللي موجوده في app bar
//   //------- لما اضغط عليها هيرجعني لل home bage
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         Navigator.of(context).pop();
//       },
//       icon: const Icon(Icons.arrow_back),
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     return  const Text(
//         'Weather App',
//         style: TextStyle(color: Colors.red));
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return
//       const Text(
//           'Weather App',
//           style: TextStyle(color: Colors.red));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_data_cubit/get_weather_cubit.dart';
import 'package:weather_app/module/weather_module.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  String? searchCityName;

  @override
  Widget build(BuildContext context) {
    // print(weatherModule.date);
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          children: [
            //-------------------- سهم الرجوع للخلف -------------
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 25,
              ),
            ),
            //----------------- مربع البحث------------------
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextField(
                  //---------------- القيمه اللي بيدخلها اليوزر في السرش --------------
                  onSubmitted: (value) {
                  var ayhaga =  BlocProvider.of<GetWeatherCubit>(context);
                  ayhaga.getWeatherData(citeName: value);
                  Navigator.pop(context);
                  },

                  //---------------------- border and hint ----------------------
                  decoration: InputDecoration(
                    hintText: 'Enter City Name...',
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.green),
                      borderRadius: BorderRadius.circular(40),
                    ),

                    //---------------------------  suffix icon -------------------
                    suffixIcon: IconButton(
                      onPressed: () {
                        print(' this is suffix icon ');
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

