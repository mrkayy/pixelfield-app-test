import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pixel_field_app/core/utils/custom_image_view.dart';
import 'package:pixel_field_app/features/_shared_widgets/scaffold_body_wrapper.widget.dart';
import 'package:pixel_field_app/features/onboarding/presentation_layer/blocs/launch_bloc/bloc.dart';
import 'package:pixel_field_app/features/onboarding/presentation_layer/blocs/launch_bloc/state.dart';
import 'package:pixel_field_app/routes.dart';
import 'package:pixel_field_app/theme.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  @override
  void initState() {
    // Initialize the AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2400,
      ), // Match the navigation delay
    );

    // Define the fade animation (from 0.0 to 1.0 opacity)
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Start the animation
    _animationController.forward();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Delay for 2900ms, then trigger navigation
      Future.delayed(const Duration(milliseconds: 2900), () {
        print("done__calculating");
        context.read<LaunchBloc>().add(NavigateToCollectionPage());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //   final readState = context.read<LaunchBloc>();
    return ScaffoldBodyWrapperWidget(
      body: Scaffold(
        backgroundColor: themeColor.transparent,
        body: BlocConsumer<LaunchBloc, LaunchState>(
          listener: (context, state) {
            if (state is UserSignedIn) {
              context.go(Routes.collectionpage.path);
            }
            if (state is UserSignedOut) {
              context.go(Routes.signin.path);
            }
            if (state is NewUserOnboarding) {
              context.go(Routes.welcome.path);
            }
          },
          builder: (context, state) {
            return Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: CustomImageView(
                  imagePath: "assets/img/one_cask_logo.png",
                  height: 140.h,
                  width: 140.w,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
