import 'package:flutter/material.dart';

class AssetUtils {

  static const commonIconPath = "assets/images/";
  static const dashboardIconPath = "assets/images/dashboard_icons/";

  static commonAssetImage(String fileName,double height,double width) {
    return Image.asset(commonIconPath+fileName,height: height,width: width, fit: BoxFit.cover);
  }

  static dashboardAssetImage(String fileName,double height,double width) {
    return Image.asset(dashboardIconPath+fileName,height: height,width: width, fit: BoxFit.cover);
  }

  static indianRupeeSign(){
    return "\u{20B9}";
  }

}