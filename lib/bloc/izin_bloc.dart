import 'dart:async';
import 'dart:convert';

import 'package:absensi/models/izin_models.dart';
import 'package:absensi/services/izin_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'izin_event.dart';
part 'izin_state.dart';

class IzinBloc extends Bloc<IzinEvent, IzinState> {
  IzinBloc(this._izinService) : super(IzinInitial());

  final IzinService _izinService;

  @override
  Stream<IzinState> mapEventToState(
    IzinEvent event,
  ) async* {
    if (event is IzinLoaded) {
      yield* _mapIzinLoaded(event);
    } else if (event is AddIzin) {
      yield* _mapAddIzin(event);
    }
  }

  Stream<IzinState> _mapIzinLoaded(IzinLoaded event) async* {
    yield IzinLoading();

    try {
      final izins = await _izinService.getAllData();

      if (izins != null && izins.length > 0) {
        yield IzinIsLoaded(izins: izins);
      } else {
        yield IzinIsEmpty();
      }
    } catch (e) {
      yield IzinFailure(message: "Terjadi masalah yang tidak diketahui");
    }
  }

  Stream<IzinState> _mapAddIzin(AddIzin event) async* {
    yield IzinAddLoading(state.izins);

    try {
      final res = await _izinService.addData(event.keterangan);

      if (!res.error) {
        final izin = new IzinModel.fromJson(res.data);

        yield IzinSuccess();
        yield IzinIsLoaded(izins: [
          izin,
          ...state.izins,
        ]);
      } else {
        yield IzinFailure(message: res.message, izins: state.izins);
      }
    } catch (e) {
      print("======> $e");
      yield IzinFailure(message: "Terjadi masalah yang tidak diketahui");
    }
  }
}
