part of 'absen_bloc.dart';

abstract class AbsenEvent extends Equatable {
  const AbsenEvent();

  @override
  List<Object> get props => [];
}

class AbsenInit extends AbsenEvent {}

class AbsenLoaded extends AbsenEvent {}
