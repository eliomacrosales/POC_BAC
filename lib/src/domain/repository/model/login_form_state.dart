class LoginFormState {
  bool isLoading;
  String? loginError;
  bool isButtonEnabled;
  bool isPasswordVisible;

  LoginFormState({
    this.isLoading = false,
    this.loginError,
    this.isButtonEnabled = false,
    this.isPasswordVisible = false,
  });
}