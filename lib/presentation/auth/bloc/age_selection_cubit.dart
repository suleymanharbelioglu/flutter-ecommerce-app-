import 'package:flutter_bloc/flutter_bloc.dart';

class AgeSelectionCubit extends Cubit<String> {
  AgeSelectionCubit() : super("Age Range");

  String selectedAge = "Age Range";
  void selecAge(String choseAge) {
    selectedAge = choseAge;
    emit(selectedAge);
  }
}
