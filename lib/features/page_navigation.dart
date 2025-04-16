import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pixel_field_app/core/utils/custom_image_view.dart';
import 'package:pixel_field_app/theme.dart';

final GlobalKey tabNavigationKey = GlobalKey<ScaffoldState>();

class BottomMenuModel {
  BottomMenuModel({required this.icon, required this.activeIcon, this.title});

  String icon;
  String activeIcon;
  String? title;
}

class TabNavigationScreen extends StatelessWidget {
  TabNavigationScreen({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  final List<BottomMenuModel> _bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.scanIconSVG,
      activeIcon: ImageConstant.scanIconSVG,
      title: "Scan",
    ),
    BottomMenuModel(
      icon: ImageConstant.collectionsIconSVG,
      activeIcon: ImageConstant.collectionsIconSVG,
      title: "Collection",
    ),
    BottomMenuModel(
      icon: ImageConstant.shopIconSVG,
      activeIcon: ImageConstant.shopIconSVG,
      title: "Shop",
    ),
    BottomMenuModel(
      icon: ImageConstant.settingsIconSVG,
      activeIcon: ImageConstant.settingsIconSVG,
      title: "Settings",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // bottomSheet: ,
      key: tabNavigationKey,
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              color: themeColor.greyBlack1,
              spreadRadius: 0,
              offset: const Offset(0, -8),
            ),
          ],
          // border: Border(
          //   top: BorderSide(
          //     width: 1.r,
          //     color: const Color(0xff161616).withOpacity(.2),
          //   ),
          // ),
        ),
        height: 90.h,
        child: BottomNavigationBar(
          backgroundColor: themeColor.greyBlack3,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: List.generate(_bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: SizedBox(
                height: 56.h,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    CustomImageView(
                      imagePath: _bottomMenuList[index].icon,
                      height: 24.h,
                      width: 24.w,
                      color: themeColor.grey3,
                    ),
                    4.verticalSpace,
                    Text(
                      _bottomMenuList[index].title ?? "",
                      style: TextStyle(
                        fontSize: 12.sp,
                        letterSpacing: -.4.sp,
                        fontWeight: FontWeight.w400,
                        color: themeColor.grey3,
                      ),
                    ),
                  ],
                ),
              ),
              activeIcon: Container(
                height: 56.h,
                // width: 65.7.w,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.8.r, color: themeColor.white),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    CustomImageView(
                      imagePath: _bottomMenuList[index].activeIcon,
                      height: 24.h,
                      width: 24.w,
                      color: themeColor.white,
                    ),
                    4.verticalSpace,
                    Text(
                      _bottomMenuList[index].title ?? "",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: themeColor.white,
                      ),
                    ),
                  ],
                ),
              ),
              label: "",
            );
          }),
          currentIndex: navigationShell.currentIndex,
          onTap: (int id) => _onIconTapped(id, context),
        ),
      ),
    );
  }

  void _onIconTapped(int index, BuildContext context) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
