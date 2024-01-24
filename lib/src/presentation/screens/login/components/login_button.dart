import 'package:bac_poc_bloc/src/core/di/login_bloc_provider.dart';
import 'package:bac_poc_bloc/src/domain/repository/model/login_form_state.dart';
import 'package:flutter/material.dart';
import 'package:bac_poc_bloc/src/presentation/blocs/login_bloc/login_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = LoginBlocProvider.of(context);

    return StreamBuilder<LoginFormState>(
      stream: loginBloc.formStateStream,
      initialData: LoginFormState(),
      builder: (_, snapshot) {
        final formState = snapshot.data!;
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: formState.isButtonEnabled ? Colors.blue[300] : Colors.grey[300],
            ),
            onPressed: formState.isButtonEnabled ? () => loginBloc.login(context) : null,
            child: formState.isLoading
                ? const CircularProgressIndicator()
                : const Text('Login', style: TextStyle(color: Colors.white)),
          ),
        );
      },
    );
  }
}
