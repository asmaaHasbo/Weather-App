import 'package:flutter/cupertino.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'There No Weather 🥴🙁😬',
            style: TextStyle(fontSize: 25),
          ),
        ),
        Center(
          child: Text('Search Now 🔍 ',
              style: TextStyle(fontSize: 25)),
        ),
      ],
    );
  }
}
