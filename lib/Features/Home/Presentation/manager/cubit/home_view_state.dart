part of 'home_view_cubit.dart';

abstract class HomeViewState {}

final class HomeViewInitial extends HomeViewState {}
final class HomeViewSuccess extends HomeViewState {
 final WeatherModel weathermodel;
  HomeViewSuccess({required this.weathermodel});
}
final class HomeViewfailure extends HomeViewState {
  final String errorMessage;

  HomeViewfailure({required this.errorMessage});
}
final class HomeViewLoading extends HomeViewState {

}

