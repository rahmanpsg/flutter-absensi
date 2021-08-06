part of 'geolocation_bloc.dart';

abstract class GeolocationState extends Equatable {
  const GeolocationState({
    this.geolocation =
        const GeolocationModel(latitude: 0, longitude: 0, radius: 0),
    this.circle = const Circle(
      circleId: CircleId(''),
    ),
  });

  final GeolocationModel geolocation;
  final Circle circle;

  @override
  List<Object> get props => [geolocation, circle];
}

class GeolocationInital extends GeolocationState {}

class GeolocationLoading extends GeolocationState {}

class GeolocationIsLoaded extends GeolocationState {
  const GeolocationIsLoaded({
    required this.geolocation,
    required this.circle,
    required this.marker,
    required this.inRadius,
  }) : super(
          geolocation: geolocation,
          circle: circle,
        );

  final GeolocationModel geolocation;
  final Circle circle;
  final Marker marker;
  final bool inRadius;

  @override
  List<Object> get props => [geolocation, circle, marker];
}

class GeolocationFailure extends GeolocationState {
  const GeolocationFailure({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
