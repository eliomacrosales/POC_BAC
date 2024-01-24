import 'package:bac_poc_bloc/src/core/di/login_bloc_provider.dart';
import 'package:bac_poc_bloc/src/domain/repository/model/login_form_state.dart';
import 'package:flutter/material.dart';
import 'package:bac_poc_bloc/src/presentation/blocs/login_bloc/login_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = LoginBlocProvider.of(context);
    return StreamBuilder<LoginFormState>(
      stream: loginBloc.formStateStream,
      initialData: LoginFormState(),
      builder: (context, snapshot) {
        final formState = snapshot.data!;
        return Column(
          children: <Widget>[
            TextField(
              controller: loginBloc.emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: const OutlineInputBorder(),
                errorText: formState.loginError,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: loginBloc.passwordController,
              obscureText: !formState.isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                      formState.isPasswordVisible ? Icons.visibility : Icons.visibility_off
                  ),
                  onPressed: loginBloc.togglePasswordVisibility,
                ),
                errorText: formState.loginError,
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
