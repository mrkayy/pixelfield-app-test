import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pixel_field_app/core/utils/custom_image_view.dart';
import 'package:pixel_field_app/features/_shared_widgets/scaffold_body_wrapper.widget.dart';
import 'package:pixel_field_app/theme.dart';

class CollectionsDetailsPage extends StatelessWidget {
  CollectionsDetailsPage({super.key});

  final BoxDecoration? selectedSegmentDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(6.r),
    // border: Border(right: BorderSide(width: 0.9.r, color: Color(0xffAEB9CC))),
    // color: themeColor.white,
    boxShadow: [
      BoxShadow(
        blurRadius: 4.r,
        spreadRadius: 0,
        offset: Offset(0, 3.r),
        color: Color(0XFF3232471A).withOpacity(0.1),
      ),
      BoxShadow(
        blurRadius: 8.r,
        spreadRadius: 0,
        offset: Offset(0, 4.r),
        color: Color(0XFF32324705).withOpacity(0.02),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return ScaffoldBodyWrapperWidget(
      body: Scaffold(
        backgroundColor: themeColor.transparent,
        appBar: AppBar(
          backgroundColor: themeColor.transparent,
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Container(
            color: themeColor.greyBlack3,
            padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r),
            child: Text(
              //todo: collection::name
              "Genesis Collection",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: themeColor.white,
              ),
            ),
          ),
          excludeHeaderSemantics: true,
          actionsPadding: EdgeInsets.only(right: 10.r),
          actions: [
            InkWell(
              onTap: context.pop,
              child: Container(
                height: 40.h,
                width: 40.w,
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: themeColor.greyBlack3,
                ),
                child: CustomImageView(imagePath: ImageConstant.closeActionSVG),
              ),
            ),
          ],
        ),
        persistentFooterAlignment: AlignmentDirectional.center,
        persistentFooterButtons: [
          ElevatedButton(onPressed: () {}, child: Row()),
        ],
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          children: [
            //todo: collection::status
            Container(
              color: themeColor.greyBlack3,
              padding: EdgeInsets.all(8.r),
              margin: EdgeInsets.only(bottom: 13.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.h,
                    child: CustomImageView(
                      imagePath: ImageConstant.genuineIconIMG,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    //todo: collection:name
                    "Genuine Bottle (Unopened)",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: themeColor.white,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 24.h,
                    child: CustomImageView(
                      imagePath: ImageConstant.downArrowSVG,
                    ),
                  ),
                ],
              ),
            ),
            // AspectRatio(
            //   aspectRatio: 5 / 4,
            //   child:
            CustomImageView(
              imagePath: ImageConstant.bottleIMG,
              fit: BoxFit.contain,
              height: 489.h,
            ),
            // ),
            Container(
              margin: EdgeInsets.only(top: 13.r),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(8.r),
                color: themeColor.greyBlack1,
              ),
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //todo: collection::bottle_details
                  Text(
                    "Bottle 135/184",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: themeColor.grey1, // Gold color
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      letterSpacing: 0.4.sp,
                    ),
                  ),
                  8.verticalSpace,
                  Text.rich(
                    TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: themeColor.grey1, // Gold color
                        fontWeight: FontWeight.w500,
                        fontSize: 32.sp,
                      ),
                      children: [
                        //todo: collection::bottle_details::name
                        TextSpan(text: "Talisker "),
                        TextSpan(
                          text: "18 Year old\n",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            color: themeColor.secondary, // Gold color
                            fontWeight: FontWeight.w500,
                            fontSize: 32.sp,
                          ),
                        ),
                        //todo: collection::bottle_details::identifier
                        TextSpan(text: "#2504"),
                      ],
                    ),
                  ),
                  SizedBox.fromSize(
                    size: Size(double.infinity, 36.r),
                    child: CupertinoSegmentedControl(
                      borderColor: themeColor.transparent,
                      unselectedColor: themeColor.greyBlack3,
                      selectedColor: themeColor.secondary,
                      onValueChanged: (value) {},
                      groupValue: 1,
                      children: {
                        1: Container(
                          padding: EdgeInsets.symmetric(vertical: 6.r),
                          decoration: selectedSegmentDecoration,
                          child: Text(
                            "Details",
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(
                              color: themeColor.grey1, // Gold color
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        2: Text(
                          "Testing Note",

                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            color: themeColor.grey1, // Gold color
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                        ),
                        3: Text(
                          "History",

                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            color: themeColor.grey1, // Gold color
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                        ),
                      },
                    ),
                  ),
                  26.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
