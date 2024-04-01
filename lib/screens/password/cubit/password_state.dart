class PasswordState {
  String password;
  PasswordStatus passwordState;
  bool isTruePassword;

  PasswordState(
      {required this.password,
      required this.passwordState,
      this.isTruePassword = false});

  PasswordState copyWithe({
    String? password,
    PasswordStatus? passwordState,
    bool? isTruePassword,
  }) {
    return PasswordState(
      password: password ?? this.password,
      passwordState: passwordState ?? this.passwordState,
      isTruePassword: isTruePassword ?? this.isTruePassword,
    );
  }
}

enum PasswordStatus {
  newPassword,
  error,
  ok,
}
