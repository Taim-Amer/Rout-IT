import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  RadioCubit() : super(RadioInitial());
  static RadioCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  // bool isMenuVisibilty = true;

  void changeRadioIndex(int index){
    currentIndex = index;
    // index == 0 ? isMenuVisibilty = true : isMenuVisibilty = false;
    emit(ChangeRadioIndex());
  }
  // bool changeMenuVisibilty(){
  //   currentIndex == 0 ? isMenuVisibilty = true : isMenuVisibilty = false;
  //   emit(HideDropdownState());
  //   return isMenuVisibilty;
  // }
}
