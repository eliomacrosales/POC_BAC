import 'dart:async';
import 'package:bac_poc_bloc/src/domain/repository/model/login_form_state.dart';
import 'package:bac_poc_bloc/src/domain/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/navigation/routes_names.dart';

class LoginBloc {
  IRepository _iRepository;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formStateController = StreamController<LoginFormState>.broadcast();

  bool _isButtonEnabled = false;
  bool _isPasswordVisible = false;

  LoginBloc(this._iRepository) {
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  Stream<LoginFormState> get formStateStream => _formStateController.stream;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  void _updateFormState(LoginFormState newState) {
    _formStateController.add(newState);
  }

  void login(BuildContext context) async {
    _updateFormState(LoginFormState(
        isLoading: true,
        isButtonEnabled: _isButtonEnabled,
        isPasswordVisible: _isPasswordVisible));
    bool success = await _iRepository.login(
        user: _emailController.text, pass: _passwordController.text);

    if (success) {
      context.goNamed(RoutesName.home,
          pathParameters: {'email': _emailController.text});
    } else {
      _updateFormState(LoginFormState(
          loginError: "Invalid credentials",
          isButtonEnabled: _isButtonEnabled,
          isPasswordVisible: _isPasswordVisible));
    }
  }

  void _onEmailChanged() {
    _checkLoginValidity();
  }

  void _onPasswordChanged() {
    _checkLoginValidity();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    _updateFormState(LoginFormState(
        isPasswordVisible: _isPasswordVisible,
        isButtonEnabled: _isButtonEnabled,
        isLoading: false,
        loginError: null));
  }

  void _checkLoginValidity() {
    bool isEmailValid = _iRepository.isValidEmail(_emailController.text);
    bool isPasswordValid = _passwordController.text.length >= 5;
    _isButtonEnabled = isEmailValid && isPasswordValid;
    _updateFormState(LoginFormState(
        isButtonEnabled: _isButtonEnabled,
        isPasswordVisible: _isPasswordVisible,
        isLoading: false,
        loginError: null));
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _formStateController.close();
  }
}
