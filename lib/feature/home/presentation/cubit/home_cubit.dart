import 'package:bloc/bloc.dart';
import 'package:bookia_application/feature/home/data/models/slider_model.dart';
import 'package:bookia_application/feature/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  getHomeSlider()async{
    emit(GetHomeSliderLoading());
    final response = await HomeRepo.getHomeSlider();

    if(response is String){
      emit(GetHomeSliderError());
    }else if (response is SliderModel){
      emit(GetHomeSliderSuccess(response.data!.sliders??[]));
    }

  }
}
