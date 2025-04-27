import 'package:ecommerce/domain/auth/usecase/get_ages.dart';
import 'package:ecommerce/presentation/auth/bloc/age_display_state.dart';
import 'package:ecommerce/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgeDisplayCubit  extends Cubit<AgeDisplayState>{
  AgeDisplayCubit() : super(AgesLoading());

  Future<void> displayAges() async {
    var returnedData = await sl<GetAgesUseCase>().call();
    returnedData.fold((error) {
      emit(AgesLoadFailure(message: error));
    }, (data) {
      emit(AgesLoaded(ages: data));
    },);
  }
}