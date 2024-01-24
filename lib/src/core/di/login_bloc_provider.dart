import 'package:flutter/material.dart';
import 'package:bac_poc_bloc/src/presentation/blocs/login_bloc/login_bloc.dart';

class LoginBlocProvider extends InheritedWidget {
  final LoginBloc loginBloc;
  final Widget child;

  const LoginBlocProvider({Key? key, required this.loginBloc, required this.child})
      : super(key: key, child: child);

  static LoginBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<LoginBlocProvider>() as LoginBlocProvider).loginBloc;
  }

  @override
  bool updateShouldNotify(LoginBlocProvider oldWidget) {
    return loginBloc != oldWidget.loginBloc;
  }
}