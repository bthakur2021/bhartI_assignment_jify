import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ColorUtils {

  final List<Color> shimmerLoadingColors = [
    Color(0xfFFE0E0E0),
    Color(0xfFFE0E0E0),
    Color(0xfFFEAF1F1),
    Color(0xfFFEAEDEA),
    Color(0xfFFE2E9E9),
    Color(0xfFFd0c9d2),
    Color(0xfFFd3cdbd),
    Color(0xfFFE8E6E9),
    Color(0xfFFE3E9E9),
    Color(0xfFFE0E0E0),
    Color(0xfFFc1b9b2),
    Color(0xfFFDADADA),
    Color(0xfFFE1E1E1),
    Color(0xfFFd0c9d2),
    Color(0xfFFEAEDEA),
    Color(0xfFFEAF1F1),
    Color(0xfFFd3cdbd),
    Color(0xfFFd8c493),
    Color(0xfFFE1E1E1),
    Color(0xfFFb5b0b0)
  ];

  Color randomShimmerLoadingColorGeneratorByIndex(int index) {
    int indexOfColor = _getShimmerLoadingColorIndex(index);
    return shimmerLoadingColors[indexOfColor];
  }

  int _getShimmerLoadingColorIndex(int index) {
    int indexOfColor = 0;
    if(index > (shimmerLoadingColors.length - 1)) {
      indexOfColor = (index % (shimmerLoadingColors.length - 1));
    } else {
      indexOfColor = index;
    }

    return indexOfColor;
  }

}

class UtilColors {
  static int hexToInt(String hex) {

    if(hex == null) {
      return -1;
    }

    if(hex.startsWith("#")) {
      hex = hex.replaceFirst("#", "");
    }

    if(hex.length == 6) {
      hex = "FF$hex";
    }
    
    int val = 0;
    int len = hex.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = hex.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("Invalid hexadecimal value");
      }
    }
    return val;
  }
}