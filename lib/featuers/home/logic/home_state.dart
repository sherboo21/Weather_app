part of 'home_cubit.dart';

@immutable
sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {}

final class GetWeatherSuccess extends HomeState {
  final WeatherDataModel data;

  const GetWeatherSuccess(this.data);

  @override
  List<Object?> get props => [data];
}

final class GetWeatherLoading extends HomeState {}

final class GetWeatherError extends HomeState {
  final Failure error;

  const GetWeatherError(this.error);

  @override
  List<Object?> get props => [error];
}
