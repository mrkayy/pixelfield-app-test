import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixel_field_app/core/utils/custom_image_view.dart';

class ScaffoldBodyWrapperWidget extends StatelessWidget {
  const ScaffoldBodyWrapperWidget({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      clipBehavior: Clip.none,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstant.scaffoldBGIMG),
                fit: BoxFit.cover,
                scale: 0.2,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          body,
        ],
      ),
    );
  }
}
