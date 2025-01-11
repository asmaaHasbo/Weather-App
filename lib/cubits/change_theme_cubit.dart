import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/main.dart';

part 'change_theme_state.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit() : super(ChangeThemeInitial());


  getColor(status){
    emit(ChangeThemeLoaded());
  }

}
