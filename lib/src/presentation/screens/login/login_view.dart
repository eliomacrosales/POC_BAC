import 'package:bac_poc_bloc/src/core/di/login_bloc_provider.dart';
import 'package:bac_poc_bloc/src/data/repository_impl/repository_impl.dart';
import 'package:bac_poc_bloc/src/presentation/screens/login/components/login_button.dart';
import 'package:bac_poc_bloc/src/presentation/screens/login/components/login_form.dart';
import 'package:flutter/material.dart';
import 'package:bac_poc_bloc/src/presentation/blocs/login_bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(RepositoryImpl());
  }

  @override
  Widget build(BuildContext context) {
    return LoginBlocProvider(
      loginBloc: _loginBloc,
      child: Scaffold(
        appBar: AppBar(title: const Center(child: Text('Login'))),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LoginForm(),
                LoginButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }
}

