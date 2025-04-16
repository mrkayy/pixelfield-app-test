import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_field_app/core/service_locator.dart';
import 'package:pixel_field_app/features/onboarding/domain_layer/signin.usecase.dart';
import 'package:pixel_field_app/features/onboarding/presentation_layer/blocs/signin_bloc/events.dart';
import 'package:pixel_field_app/features/onboarding/presentation_layer/blocs/signin_bloc/state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc({this.usecase}) : super(SigninState()) {
    usecase = usecase ?? getIt<SigninUserUsecase>();

    on<EmailValidation>((event, emit) {
      var res = _validateEmailField(event.email ?? "");
      emit(state.copyWith(email: event.email, emailError: res));
    });
    on<PasswordValidation>((event, emit) {
      var res = _validatePasswordField(event.password);
      emit(SigninState(passwordError: res, password: event.password));
    });

    on<SignInFormValidation>(_validateUserDataFromCache);
  }

  late SigninUserUsecase? usecase;

  String? _validateEmailField(String v) {
    if (v.isEmpty) {
      return "Email is required";
    }
    if (!RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(v)) {
      return "Invalid email";
    }
    return null;
  }

  String? _validatePasswordField(String? v) {
    if (v == null || v.isEmpty) return "Password field cannot be empty!";
    return null;
  }

  void _validateUserDataFromCache(
    SignInFormValidation event,
    Emitter<SigninState> emit,
  ) async {
    final form = event.formState.currentState!;
    if ((event.email == null) || (event.email!.isEmpty)) {
      emit(
        state.copyWith(
          email: event.email,
          emailError: _validateEmailField(event.email ?? ""),
        ),
      );
    } else if ((event.password == null) || (event.password!.isEmpty)) {
      emit(
        state.copyWith(
          password: event.password,
          passwordError: _validatePasswordField(event.password),
        ),
      );
    } else {
      if (form.validate()) {
          emit(LoadingState(isloading: true));
        var payload = {"email": event.email, "password": event.password};
        final res = await usecase!.call(payload);
          emit(LoadingState(isloading: false));
        if (res.err == null) {
          emit(ValidationSuccessState());
          debugPrint(res.user?.email);
        } else {
          emit(ValidationErrorState());
          debugPrint(res.err?.message);
        }
      }
    }
    //todo: make api call to mock_database.
  }
}
