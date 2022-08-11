import 'package:flutter/material.dart';

final kInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: BorderSide.none,
);

const kTitleStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
const kSubtitleStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
const kCaptionStyle = TextStyle(fontSize: 12, fontWeight: FontWeight.normal);
const koverlineStyle = TextStyle(fontSize: 10, fontWeight: FontWeight.normal);

///
extension StyleX on TextStyle {
  TextStyle get red => copyWith(color: Colors.red);
  TextStyle get green => copyWith(color: Colors.green);

  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
}
