import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pixel_field_app/features/_shared_widgets/custom_text_form_field.dart';
import 'package:pixel_field_app/features/onboarding/presentation_layer/blocs/signin_bloc/bloc.dart';
import 'package:pixel_field_app/features/onboarding/presentation_layer/blocs/signin_bloc/events.dart';
import 'package:pixel_field_app/features/onboarding/presentation_layer/blocs/signin_bloc/state.dart';
import 'package:pixel_field_app/routes.dart';
import 'package:pixel_field_app/theme.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(backgroundColor: themeColor.transparent),
      body: BlocConsumer<SigninBloc, SigninState>(
        listener: (context, state) {
          if (state is ValidationSuccessState) {
            context.go(Routes.collectionpage.path);
          }
          if(state is ValidationErrorState){
            
          }
        },
        builder: (context, state) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            children: [
              40.verticalSpace,
              Text(
                "Sign in",
                style: textTheme.bodySmall!.copyWith(
                  fontFamily: "EB Garamond",
                  fontSize: 32.sp,
                  letterSpacing: -.4.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              40.verticalSpace,
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: _emailController,
                      errorText: state.emailError,
                      validator: (val) {
                        context.read<SigninBloc>().add(EmailValidation(val));
                        return state.emailError;
                      },
                      onChanged: (val) {
                        context.read<SigninBloc>().add(EmailValidation(val));
                      },
                    ),
                    16.verticalSpace,
                    CustomTextFormField(
                      controller: _passwordController,
                      errorText: state.passwordError,

                      onChanged: (val) {
                        context.read<SigninBloc>().add(PasswordValidation(val));
                      },
                    ),
                  ],
                ),
              ),
              40.verticalSpace,
              ElevatedButton(
                onPressed: () {
                  context.read<SigninBloc>().add(
                    SignInFormValidation(
                      formState: _formKey,
                      email: _emailController.text,
                      password: _passwordController.text,
                    ),
                  );
                },
                child: Text("Continue"),
              ),
              40.verticalSpace,
              Padding(
                padding: EdgeInsets.all(12.r),
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    style: textTheme.displayMedium!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: themeColor.grey2,
                      letterSpacing: .1.sp,
                    ),
                    children: [
                      TextSpan(text: "Can’t sign in? \t\t"),
                      TextSpan(
                        text: "Recover password",
                        style: textTheme.displayMedium!.copyWith(
                          color: themeColor.secondary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: .1.sp,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                print("I forgot my password");
                              },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
