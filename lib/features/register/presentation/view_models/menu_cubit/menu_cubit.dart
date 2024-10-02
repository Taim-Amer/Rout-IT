import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuInitial());
  static MenuCubit get(context) => BlocProvider.of(context);

  bool isTapped = true;
  bool isExpanded = false;
  double menuHeight = 30;

  List<String> university = [
    "Damascus University",
    "Tishreen University",
    "Al-Baath University",
    "Al-Furat University",
    "Aleppo University",
    "Al-Andalus University",
  ];

  void tap(){
    isTapped = !isTapped;
    emit(TappedMenuState());
  }

  double changeMenuHeight(){
    if(isTapped == true){
      if(isExpanded == true){
        menuHeight = 60;
      }else{
        menuHeight = 50;
      }
    }else{
      if(isExpanded == true){
        menuHeight = 200;
      }else{
        menuHeight = 190;
      }
    }

    return menuHeight;
  }
}
