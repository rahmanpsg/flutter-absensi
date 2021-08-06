part of 'histori_bloc.dart';

abstract class HistoriState extends Equatable {
  const HistoriState({this.bulan = '', this.tahun = ''});

  final String bulan;
  final String tahun;

  @override
  List<Object> get props => [bulan, tahun];
}

class HistoriInitial extends HistoriState {}

class HistoriChangeDropDown extends HistoriState {
  const HistoriChangeDropDown(this.bulan, this.tahun);

  final String bulan;
  final String tahun;

  @override
  List<Object> get props => [bulan, tahun];
}

class HistoriLoading extends HistoriState {
  const HistoriLoading(this.bulan, this.tahun)
      : super(bulan: bulan, tahun: tahun);

  final String bulan;
  final String tahun;

  @override
  List<Object> get props => [bulan, tahun];
}

class HistoriIsLoaded extends HistoriState {
  const HistoriIsLoaded({
    required this.historis,
    required this.bulan,
    required this.tahun,
  }) : super(bulan: bulan, tahun: tahun);

  final List<HistoriModel> historis;
  final String bulan;
  final String tahun;

  @override
  List<Object> get props => [historis, bulan, tahun];
}

class HistoriFailure extends HistoriState {
  const HistoriFailure({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
