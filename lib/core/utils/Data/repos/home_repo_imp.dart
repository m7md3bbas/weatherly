import 'package:dartz/dartz.dart';
import 'package:weatherlyapp/core/utils/Data/models/weather.dart';
import 'package:weatherlyapp/core/utils/api/api_consumer.dart';
import 'package:weatherlyapp/errors/exceptions.dart';

class UserRepository {
  final ApiConsumer api;
  final String apiKey; // Add apiKey as a parameter

  UserRepository({required this.api, required this.apiKey});

  Future<Either<String, WeatherModel>> getHomeWeather(
      {required String location}) async {
    try {
      final response =
          await api.get("forecast.json?key=$apiKey&q=$location&days=1&aqi=yes");
     
      return Right(WeatherModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage);
    } catch (e) {
      // Handle any unexpected errors
      return Left("An unexpected error occurred: ${e.toString()}");
    }
  }
}
