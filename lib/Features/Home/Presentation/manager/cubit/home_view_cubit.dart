import 'package:bloc/bloc.dart';
import 'package:weatherlyapp/core/utils/Data/models/weather.dart';
import 'package:weatherlyapp/core/utils/Data/repos/home_repo_imp.dart';

part 'home_view_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit({required this.userRepository}) : super(HomeViewInitial());

  final UserRepository userRepository;

  Future<void> fetchWeatherDetails({required String location }) async {
    emit(HomeViewLoading());
    final response = await userRepository.getHomeWeather(location: location);
    
    response.fold(
      (errorMessage) {
        emit(HomeViewfailure(errorMessage: errorMessage));
      },
      (weathermodel) {
        emit(HomeViewSuccess(weathermodel: weathermodel));
      },
    );
  }
}
