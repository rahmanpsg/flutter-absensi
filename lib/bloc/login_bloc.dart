import 'dart:async';

import 'package:absensi/bloc/absen_bloc.dart';
import 'package:absensi/bloc/authentication_bloc.dart';
import 'package:absensi/models/responseApi_models.dart';
import 'package:absensi/models/user_models.dart';
import 'package:absensi/services/authentication_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(
      this._authenticationBloc, this._absenBloc, this._authenticationService)
      : super(LoginInitial());

  final AuthenticationBloc _authenticationBloc;
  final AbsenBloc _absenBloc;
  final AuthenticationService _authenticationService;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonClick) {
      yield* _mapLoginToState(event);
    }
  }

  Stream<LoginState> _mapLoginToState(LoginButtonClick event) async* {
    yield LoginLoading();

    try {
      final res =
          await _authenticationService.signIn(event.username, event.password);

      if (res is UserModel) {
        _authenticationBloc.add(UserLoggedIn(user: res));
        _absenBloc.add(AbsenLoaded());
        yield LoginSuccess();
        yield LoginInitial();
      } else {
        yield LoginFailure(message: (res as ResponseApiModel).message);
      }
    } catch (err) {
      yield LoginFailure(message: 'Terjadi masalah yang tidak diketahui');
    }
  }
}
