import 'package:equatable/equatable.dart';

class SigninState extends Equatable {
  const SigninState({
    this.email,
    this.password,
    this.emailError,
    this.passwordError,
    this.hidePassword,
  });

  SigninState copyWith({
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
    bool? hidePassword,
  }) {
    return SigninState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: emailError,
      hidePassword: hidePassword ?? this.hidePassword,
      passwordError: passwordError,
    );
  }

  final String? email;
  final String? password;
  final String? emailError;
  final String? passwordError;
  final bool? hidePassword;

  @override
  List<Object?> get props => [
    email,
    password,
    emailError,
    passwordError,
    hidePassword,
  ];
}

class LoadingState extends SigninState {
  LoadingState({required this.isloading});
  final bool isloading;

  @override
  List<Object?> get props => [isloading];
}

class ValidationSuccessState extends SigninState {
  @override
  List<Object?> get props => [];
}
