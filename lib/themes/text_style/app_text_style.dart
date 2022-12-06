import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_app/themes/color/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyle {
  static TextStyle s36Abel = GoogleFonts.abel(fontSize: 36);
  static TextStyle s17Abel = GoogleFonts.abel(fontSize: 17);
  static TextStyle s14AbelGrey =
      GoogleFonts.abel(fontSize: 14, color: AppColor.color9E9E9E);
  static TextStyle s17AbelPurple =
      GoogleFonts.abel(fontSize: 17, color: AppColor.color7E57C2);
}
