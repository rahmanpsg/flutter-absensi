part of 'izin_bloc.dart';

abstract class IzinEvent extends Equatable {
  const IzinEvent();

  @override
  List<Object> get props => [];
}

class IzinLoaded extends IzinEvent {}

class AddIzin extends IzinEvent {
  const AddIzin(this.keterangan);

  final String keterangan;
}
