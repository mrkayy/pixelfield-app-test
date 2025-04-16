import "dart:io";
import "package:flutter/material.dart";
import "package:cached_network_image/cached_network_image.dart";
import "package:flutter_svg/flutter_svg.dart";

final class ImageConstant {
  //folder path
  static String imagePath = "assets/img";
  static String svgPath = "assets/svgs";

  static String bottleIMG = "$imagePath/timeelite_bottle.png";
  static String genuineIconIMG = "$imagePath/genuine_icon.png";
  static String logoIMG = "$imagePath/one_cask_logo.png";
  static String scaffoldBGIMG = "$imagePath/launch_bg.png";

  static String scanIconSVG = "$svgPath/scan.svg";
  static String collectionsIconSVG = "$svgPath/collection.svg";
  static String settingsIconSVG = "$svgPath/settings.svg";
  static String shopIconSVG = "$svgPath/shop_bottle.svg";

  static String closeActionSVG = "$svgPath/close_icon.svg";
  static String notificationSVG = "$svgPath/notification_bell.svg";
  static String notificationBadgeSVG = "$svgPath/notification_badge.svg";
  static String timelineSVG = "$svgPath/timeline.svg";
  static String timeline2SVG = "$svgPath/timeline_2.svg";
  static String downArrowSVG = "$svgPath/down_arrow.svg";
  static String placeHolderSVG = "$svgPath/image_placeholder.svg";
  // static String SVG = "$svgPath/.svg";
  // static String SVG = "$svgPath/.svg";
  // static String SVG = "$svgPath/.svg";
}

enum ImageType { svg, png, network, file, unknown }

extension ImageTypeExtension on String {
  ImageType get imageType {
    if (this.startsWith("http") || this.startsWith("https")) {
      return ImageType.network;
    } else if (this.endsWith(".svg")) {
      return ImageType.svg;
    } else if (this.startsWith("file://")) {
      return ImageType.file;
    } else {
      return ImageType.png;
    }
  }
}

// ignore_for_file: must_be_immutable
class CustomImageView extends StatelessWidget {
  CustomImageView({
    this.imagePath,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.alignment,
    this.onTap,
    this.radius,
    this.margin,
    this.border,
    this.placeHolder = "assets/images/image_not_found.png",
  });

  ///[imagePath] is required parameter for showing image
  String? imagePath;

  double? height;

  double? width;

  Color? color;

  BoxFit? fit;

  final String placeHolder;

  Alignment? alignment;

  VoidCallback? onTap;

  EdgeInsetsGeometry? margin;

  BorderRadius? radius;

  BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(alignment: alignment!, child: _buildWidget())
        : _buildWidget();
  }

  Widget _buildWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(onTap: onTap, child: _buildCircleImage()),
    );
  }

  ///build the image with border radius
  dynamic _buildCircleImage() {
    if (radius != null) {
      return ClipRRect(
        borderRadius: radius ?? BorderRadius.zero,
        child: _buildImageWithBorder(),
      );
    } else {
      return _buildImageWithBorder();
    }
  }

  ///build the image with border and border radius style
  Widget _buildImageWithBorder() {
    if (border != null) {
      return Container(
        decoration: BoxDecoration(border: border, borderRadius: radius),
        child: _buildImageView(),
      );
    } else {
      return _buildImageView();
    }
  }

  Widget _buildImageView() {
    if (imagePath != null) {
      switch (imagePath!.imageType) {
        case ImageType.svg:
          return SizedBox(
            height: height,
            width: width,
            child: SvgPicture.asset(
              imagePath!,
              height: height,
              width: width,
              color: color,
              fit: fit ?? BoxFit.contain,
            ),
          );
        case ImageType.file:
          return Image.file(
            File(imagePath!),
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: color,
          );
        case ImageType.network:
          return CachedNetworkImage(
            height: height,
            width: width,
            fit: fit,
            imageUrl: imagePath!,
            color: color,
            placeholder:
                (context, url) => SizedBox(
                  height: 30,
                  width: 30,
                  child: LinearProgressIndicator(
                    color: Colors.grey.shade200,
                    backgroundColor: Colors.grey.shade100,
                  ),
                ),
            errorWidget:
                (context, url, error) => Image.asset(
                  placeHolder,
                  height: height,
                  width: width,
                  fit: fit ?? BoxFit.cover,
                ),
          );
        case ImageType.png:
        default:
          return Image.asset(
            imagePath!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: color,
          );
      }
    }
    return SizedBox();
  }
}
