import 'package:flutter/material.dart';
import 'package:javettieri/theme/app_colors.dart';

class AppFonts {
  static const specialHead = 'Righteous';
  static const primaryFont = 'MPLUSRounded1c';

  // Titolo principale (usa Righteous)
  static const TextStyle heading1 = TextStyle(
      fontFamily: specialHead, fontSize: 28, color: AppColors.primary);

  // Sottotitolo / heading secondario
  static const TextStyle heading2 = TextStyle(
    fontFamily: primaryFont,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  // Testo normale
  static const TextStyle body = TextStyle(
      fontFamily: primaryFont,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: AppColors.primary);

  // Didascalia / testo piccolo
  static const TextStyle caption = TextStyle(
    fontFamily: primaryFont,
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: Colors.grey,
  );

  // Pulsanti o etichette
  static const TextStyle label = TextStyle(
    fontFamily: primaryFont,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
