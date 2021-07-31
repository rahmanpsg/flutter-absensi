import 'dart:async';

import 'package:absensi/bloc/authentication_bloc.dart';
import 'package:absensi/models/user_models.dart';
import 'package:absensi/services/authentication_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc _authenticationBloc;
  final AuthenticationService _authenticationService;

  LoginBloc(this._authenticationBloc, this._authenticationService)
      : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonClick) {
      yield* _mapLoginWithEmailToState(event);
    }
  }

  Stream<LoginState> _mapLoginWithEmailToState(LoginButtonClick event) async* {
    yield LoginLoading();

    try {
      final user =
          await _authenticationService.signIn(event.username, event.password);

      if (user is UserModel) {
        _authenticationBloc.add(UserLoggedIn(user: user));
        yield LoginSuccess();
        yield LoginInitial();
      } else {
        yield LoginFailure(error: user);
      }
    } catch (err) {
      yield LoginFailure(error: 'Terjadi masalah yang tidak diketahui');
    }
  }
}
