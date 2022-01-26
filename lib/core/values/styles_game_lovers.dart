import 'package:flutter/material.dart';
import 'package:game_lovers_app/core/values/colors_game_lovers.dart';
import 'package:google_fonts/google_fonts.dart';

class StylesGameLovers {
  static final TextStyle titleAppBar = GoogleFonts.ptSansNarrow(
    color: ColorsGameLovers.black,
    fontWeight: FontWeight.w700,
    fontSize: 24,
  );
  static final TextStyle bodyBlack = GoogleFonts.ptSansNarrow(
    color: ColorsGameLovers.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle bodyBlack16 = GoogleFonts.ptSansNarrow(
    color: ColorsGameLovers.black,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}
