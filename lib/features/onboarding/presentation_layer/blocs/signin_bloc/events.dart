import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SigninEvent extends Equatable {}

class EmailValidation extends SigninEvent {
  EmailValidation(this.email);
  final String? email;
  @override
  List<Object?> get props => [email];
}

class PasswordValidation extends SigninEvent {
  PasswordValidation(this.password);
  final String? password;
  @override
  List<Object?> get props => [password];
}

class SignInFormValidation extends SigninEvent {
  SignInFormValidation({required this.formState, this.email, this.password});
  final GlobalKey<FormState> formState;
  final String? email, password;
  @override
  List<Object?> get props => [formState, email, password];
}
