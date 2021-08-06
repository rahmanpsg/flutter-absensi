import 'dart:async';

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
    print(event);
    if (event is AbsenLoaded) {
      yield* _mapDataLoaded(event);
    }
  }

  Stream<AbsenState> _mapDataLoaded(AbsenLoaded event) async* {
    yield AbsenLoading();

    try {
      // await Future.delayed(Duration(milliseconds: 2000)); // a simulated delay
      final absenRule = await _absenService.getAbsenRule();

      if (absenRule != null) {
        yield AbsenIsLoaded(absen: absenRule);
      } else {
        yield AbsenFailure(message: 'Tidak dapat terhubung ke server');
      }
    } catch (e) {
      yield AbsenFailure(message: 'Terjadi masalah yang tidak diketahui');
    }
  }
}
