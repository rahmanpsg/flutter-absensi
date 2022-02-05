import 'dart:async';

import 'package:absensi/models/cuti_models.dart';
import 'package:absensi/services/cuti_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cuti_event.dart';
part 'cuti_state.dart';

class CutiBloc extends Bloc<CutiEvent, CutiState> {
  CutiBloc(this._cutiService) : super(CutiInitial());

  final CutiService _cutiService;

  @override
  Stream<CutiState> mapEventToState(
    CutiEvent event,
  ) async* {
    if (event is CutiLoaded) {
      yield* _mapCutiLoaded(event);
    } else if (event is AddCuti) {
      yield* _mapAddCuti(event);
    } else if (event is CutiReset) {
      yield CutiInitial();
    }
  }

  Stream<CutiState> _mapCutiLoaded(CutiLoaded event) async* {
    if (!(state is CutiIsLoaded)) yield CutiLoading();

    try {
      final cutis = await _cutiService.getAllData();

      yield CutiSuccess();

      if (cutis != null && cutis.length > 0) {
        yield CutiIsLoaded(cutis: cutis);
      } else {
        yield CutiIsEmpty();
      }
    } catch (e) {
      yield CutiFailure(message: "Terjadi masalah yang tidak diketahui");
    }
  }

  Stream<CutiState> _mapAddCuti(AddCuti event) async* {
    yield CutiAddLoading(state.cutis);

    try {
      final res = await _cutiService.addData(event.cuti);

      if (!res.error) {
        final cuti = new CutiModel.fromJson(res.data);

        yield CutiSuccess();
        yield CutiIsLoaded(cutis: [
          cuti,
          ...state.cutis,
        ]);
      } else {
        yield CutiFailure(message: res.message, cutis: state.cutis);
      }
    } catch (e) {
      print("======> $e");
      yield CutiFailure(message: "Terjadi masalah yang tidak diketahui");
    }
  }
}
