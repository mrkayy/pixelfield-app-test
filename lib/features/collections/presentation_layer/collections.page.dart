import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel_field_app/core/utils/custom_image_view.dart';
import 'package:pixel_field_app/routes.dart';
import 'package:pixel_field_app/theme.dart';

class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor.transparent,
        centerTitle: false,
        title: Text(
          "My collection",
          style: GoogleFonts.ebGaramond().copyWith(
            fontSize: 32.sp,
            fontWeight: FontWeight.w500,
            color: themeColor.white,
          ),
        ),
        actionsPadding: EdgeInsets.only(right: 10.r),
        actions: [
          CustomImageView(imagePath: ImageConstant.notificationBadgeSVG),
        ],
      ),
      body: GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(left: 16.r, right: 16.r, top: 40.r),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 8.0, // Space between columns
          mainAxisSpacing: 8.0, // Space between rows
          childAspectRatio: 0.55, // Adjust the aspect ratio to fit content
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to a detail page if needed
              context.push(Routes.collectiondetaiilpage.path);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: themeColor.greyBlack1,
              ),
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: CustomImageView(
                      imagePath: ImageConstant.bottleIMG,
                      height: 190.h,
                    ),
                  ),
                  16.verticalSpace,
                  Text(
                    "Springbank",
                    style: GoogleFonts.ebGaramond().copyWith(
                      color: themeColor.grey1, // Gold color
                      fontWeight: FontWeight.w600,
                      fontSize: 22.sp,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "1992 #1234",
                    style: GoogleFonts.ebGaramond().copyWith(
                      color: themeColor.grey1, // Gold color
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "(112/158)",
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: .4.sp,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
