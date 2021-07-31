import 'package:absensi/bloc/login_bloc.dart';
import 'package:absensi/styles/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _autoValidate = false;
  bool _userTFValid = false;
  bool _passTFValid = false;

  Widget _buildUsernameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Username",
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        Container(
          decoration: kBoxDecorationStyle,
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextFormField(
            controller: _usernameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Username tidak boleh kosong';
              }
              return null;
            },
            onChanged: (value) {
              if (!_autoValidate) {
                return;
              }
              setState(() {
                _userTFValid = value.length < 1;
              });
            },
            textInputAction: TextInputAction.next,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                top: _userTFValid ? 20.0 : 14.0,
                left: 49,
              ),
              prefixIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              hintText: "Masukan username",
              hintStyle: kHintStyle,
              errorStyle: kLabelStyle.copyWith(color: Colors.amber[300]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Password",
          style: kLabelStyle,
        ),
        SizedBox(height: 5.0),
        Container(
          decoration: kBoxDecorationStyle,
          alignment: Alignment.centerLeft,
          height: 60.0,
          child: TextFormField(
            obscureText: true,
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password tidak boleh kosong';
              }
              return null;
            },
            onChanged: (value) {
              if (!_autoValidate) {
                return;
              }
              setState(() {
                _passTFValid = value.length < 1;
              });
            },
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                top: _passTFValid ? 20.0 : 14.0,
                left: 49,
              ),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: "Masukan password",
              hintStyle: kHintStyle,
              errorStyle: kLabelStyle.copyWith(color: Colors.amber[300]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn(callback, isLoading) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => callback(),
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              )
            : Text(
                'LOGIN',
                style: TextStyle(
                  color: primaryColor,
                  letterSpacing: 1.5,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }

  void _showError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(error),
      backgroundColor: Theme.of(context).errorColor,
      duration: const Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final _loginBloc = BlocProvider.of<LoginBloc>(context);

    _onLoginButtonPressed() {
      if (_key.currentState!.validate()) {
        _loginBloc.add(LoginButtonClick(
          username: _usernameController.text,
          password: _passwordController.text,
        ));
      } else {
        setState(() {
          _autoValidate = true;
          _userTFValid = _usernameController.text.length < 1;
          _passTFValid = _passwordController.text.length < 1;
        });
      }
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          _showError(state.error);
        }

        if (state is LoginSuccess) {
          Navigator.of(context).pushReplacementNamed('/');
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Form(
            key: _key,
            autovalidateMode: _autoValidate
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
            child: Column(
              children: <Widget>[
                _buildUsernameTF(),
                SizedBox(height: 15),
                _buildPasswordTF(),
                _buildLoginBtn(
                    state is LoginLoading ? () {} : _onLoginButtonPressed,
                    state is LoginLoading),
              ],
            ),
          );
        },
      ),
    );
  }
}
