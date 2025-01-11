

class WeatherState{}

class WeatherLoadedState extends WeatherState {

  WeatherLoadedState();
}
class NoWeatherState extends WeatherState{

}
class WeatherFailureState extends WeatherState {
  String errorMsg;
  WeatherFailureState( {required this.errorMsg});
}

class WeatherThemeChangeState extends WeatherState{}