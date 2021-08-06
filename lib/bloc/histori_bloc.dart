import 'dart:async';

import 'package:absensi/models/histori_models.dart';
import 'package:absensi/models/responseApi_models.dart';
import 'package:absensi/services/absen_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'histori_event.dart';
part 'histori_state.dart';

class HistoriBloc extends Bloc<HistoriEvent, HistoriState> {
  HistoriBloc(this._absenService) : super(HistoriInitial());

  final AbsenService _absenService;

  @override
  Stream<HistoriState> mapEventToState(
    HistoriEvent event,
  ) async* {
    print(event);
    if (event is ChangeBulan) {
      yield HistoriChangeDropDown(event.bulan, state.tahun);
    } else if (event is ChangeTahun) {
      yield HistoriChangeDropDown(state.bulan, event.tahun);
    } else if (event is HistoriLoaded) {
      yield* _mapHistoriLoaded(event);
    }
  }

  Stream<HistoriState> _mapHistoriLoaded(HistoriLoaded event) async* {
    yield HistoriLoading(event.bulan, event.tahun);

    try {
      final histori =
          await _absenService.getAbsenHistori(event.bulan, event.tahun);

      print(histori);

      if (histori is List<HistoriModel>) {
        yield HistoriIsLoaded(
          historis: histori,
          bulan: event.bulan,
          tahun: event.tahun,
        );
      } else if (histori is ResponseApiModel) {
        yield HistoriFailure(message: histori.message);
      }
    } catch (e) {
      yield HistoriFailure(message: 'Terjadi masalah yang tidak diketahui');
    }
  }
}
