part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetHomeSliderLoading extends HomeState {}
final class GetHomeSliderSuccess extends HomeState {
  final List <Sliders> sliders ;
  GetHomeSliderSuccess(this.sliders);
}
final class GetHomeSliderError extends HomeState {}
