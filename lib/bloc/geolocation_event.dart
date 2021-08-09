part of 'geolocation_bloc.dart';

abstract class GeolocationEvent extends Equatable {
  const GeolocationEvent();

  @override
  List<Object> get props => [];
}

class GeolocationLoaded extends GeolocationEvent {}

class ChangePosition extends GeolocationEvent {
  ChangePosition(this.position);

  final LatLng position;
}

class AuthenticationBiometric extends GeolocationEvent {}
