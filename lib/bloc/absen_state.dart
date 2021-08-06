part of 'absen_bloc.dart';

abstract class AbsenState extends Equatable {
  const AbsenState();

  @override
  List<Object> get props => [];
}

class AbsenInitial extends AbsenState {}

class AbsenLoading extends AbsenState {}

class AbsenIsLoaded extends AbsenState {
  const AbsenIsLoaded({required this.absen});

  final AbsenModel absen;

  @override
  List<Object> get props => [absen];
}

class AbsenFailure extends AbsenState {
  const AbsenFailure({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
