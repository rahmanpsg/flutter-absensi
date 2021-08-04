part of 'geolocation_bloc.dart';

abstract class GeolocationState extends Equatable {
  const GeolocationState(this.geolocation, this.circle);

  final GeolocationModel geolocation;
  final Circle circle;

  @override
  List<Object> get props => [geolocation, circle];
}

class GeolocationInital extends GeolocationState {
  GeolocationInital()
      : super(
          const GeolocationModel(latitude: 0, longitude: 0, radius: 0),
          const Circle(
            circleId: CircleId(''),
          ),
        );
}

class GeolocationLoading extends GeolocationState {
  GeolocationLoading()
      : super(
          const GeolocationModel(latitude: 0, longitude: 0, radius: 0),
          const Circle(
            circleId: CircleId(''),
          ),
        );
}

class GeolocationIsLoaded extends GeolocationState {
  const GeolocationIsLoaded({
    required this.geolocation,
    required this.circle,
    required this.marker,
    required this.inRadius,
  }) : super(
          geolocation,
          circle,
        );

  final GeolocationModel geolocation;
  final Circle circle;
  final Marker marker;
  final bool inRadius;

  @override
  List<Object> get props => [geolocation, circle, marker];
}

class GeolocationFailure extends GeolocationState {
  const GeolocationFailure({required this.message})
      : super(
          const GeolocationModel(latitude: 0, longitude: 0, radius: 0),
          const Circle(
            circleId: CircleId(''),
          ),
        );

  final String message;

  @override
  List<Object> get props => [message];
}
