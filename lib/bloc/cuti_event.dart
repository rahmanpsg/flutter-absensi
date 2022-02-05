part of 'cuti_bloc.dart';

abstract class CutiEvent extends Equatable {
  const CutiEvent();

  @override
  List<Object> get props => [];
}

class CutiLoaded extends CutiEvent {}

class AddCuti extends CutiEvent {
  const AddCuti(this.cuti);

  final CutiModel cuti;
}

class CutiReset extends CutiEvent {}
