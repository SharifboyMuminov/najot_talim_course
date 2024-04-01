class PasswordState {
  String password;
  PasswordStatus passwordState;

  PasswordState({required this.password, required this.passwordState});

  PasswordState copyWithe({
    String? password,
    PasswordStatus? passwordState,
  }) {
    return PasswordState(
      password: password ?? this.password,
      passwordState: passwordState ?? this.passwordState,
    );
  }
}


enum PasswordStatus{
  newPassword,
  error,
  ok,
}
