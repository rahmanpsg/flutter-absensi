import 'dart:async';
import 'dart:developer';

import 'package:absensi/models/absen_models.dart';
import 'package:absensi/services/absen_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'absen_event.dart';
part 'absen_state.dart';

class AbsenBloc extends Bloc<AbsenEvent, AbsenState> {
  AbsenBloc(this._absenService) : super(AbsenInitial());

  final AbsenService _absenService;

  @override
  Stream<AbsenState> mapEventToState(
    AbsenEvent event,
  ) async* {
    log(event.toString());
    if (event is AbsenInit) {
      _absenService.initBackgroundFetch();
      yield* _mapDataLoaded();
    }
    if (event is AbsenLoaded) {
      yield* _mapDataLoaded();
    }
  }

  Stream<AbsenState> _mapDataLoaded() async* {
    yield AbsenLoading();

    try {
      final absenRule = await _absenService.getAbsenRule();

      if (absenRule != null) {
        yield AbsenIsLoaded(absen: absenRule);

        if (absenRule.waktuDatang.isNotEmpty && absenRule.waktuPulang.isEmpty) {
          _absenService.startSchedule();
        } else {
          _absenService.stopSchedule();
        }
      } else {
        yield AbsenFailure(message: 'Tidak dapat terhubung ke server');
      }
    } catch (e) {
      print(e);
      yield AbsenFailure(message: e.toString());
    }
  }
}
