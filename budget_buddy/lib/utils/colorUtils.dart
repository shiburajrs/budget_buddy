import 'dart:ui';

class ColorUtils {

 static List categoryColor = [
    Color(0xffADD8E6),
    Color(0xff90EE90),
    Color(0xffEEE8AA),
    Color(0xffE6E6FA),
    Color(0xffFFDAB9),
    Color(0xffF08080),
    Color(0xffFFA07A),
    Color(0xffFFB6C1),
    Color(0xffFFFFE0),
    Color(0xffE6A8D7)
  ];
  static Color primaryColor = Color(0xff3c50b3);

  static Color getCategoryColor(int index) {
    return categoryColor[index % 10];
  }
}