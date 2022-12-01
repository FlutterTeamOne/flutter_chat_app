import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_app/themes/color/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyle {
  static TextStyle s36Abel = GoogleFonts.abel(fontSize: 36);
  static TextStyle s16Abel = GoogleFonts.abel(fontSize: 16);
  static TextStyle s16AbelPurple =
      GoogleFonts.abel(fontSize: 16, color: AppColor.color7E57C2);
}
