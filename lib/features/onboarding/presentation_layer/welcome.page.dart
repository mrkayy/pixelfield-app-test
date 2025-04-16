import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pixel_field_app/features/_shared_widgets/scaffold_body_wrapper.widget.dart';
import 'package:pixel_field_app/routes.dart';
import 'package:pixel_field_app/theme.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldBodyWrapperWidget(
      body: Scaffold(
        backgroundColor: themeColor.transparent,
        body: SafeArea(
          top: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 24.r, horizontal: 16.r),
              margin: EdgeInsets.symmetric(horizontal: 16.r),
              decoration: BoxDecoration(color: themeColor.greyBlack1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Welcome!",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: themeColor.white, // Gold color
                      fontWeight: FontWeight.w500,
                      fontSize: 32.sp,
                    ),
                  ),
                  16.verticalSpace,
                  ElevatedButton(
                    onPressed: () {
                      // context.go(Routes.scanpage.path);
                    },
                    child: Text("Scan bottle"),
                  ),
                  24.verticalSpace,
                  Padding(
                    padding: EdgeInsets.all(12.r),
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        style: Theme.of(
                          context,
                        ).textTheme.displayMedium!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: themeColor.grey2,
                          letterSpacing: .1.sp,
                        ),
                        children: [
                          TextSpan(text: "Have an account?    "),
                          TextSpan(
                            text: "Sign in first",
                            style: Theme.of(
                              context,
                            ).textTheme.displayMedium!.copyWith(
                              color: themeColor.secondary,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .1.sp,
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    context.go(Routes.signin.path);
                                  },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
