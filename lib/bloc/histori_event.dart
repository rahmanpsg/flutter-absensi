part of 'histori_bloc.dart';

abstract class HistoriEvent extends Equatable {
  const HistoriEvent();

  @override
  List<Object> get props => [];
}

class ChangeBulan extends HistoriEvent {
  const ChangeBulan(this.bulan);

  final String bulan;
}

class ChangeTahun extends HistoriEvent {
  const ChangeTahun(this.tahun);

  final String tahun;
}

class HistoriLoaded extends HistoriEvent {
  const HistoriLoaded({required this.bulan, required this.tahun});

  final String bulan;
  final String tahun;
}
