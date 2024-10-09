import 'package:flutter/material.dart';
import 'package:f11_flutter/shared/constants/sizes.dart';

/// A class that defines the text styles used in the app.
class AppTextStyles {
  /// The default font family used for text in the app.
  static const String fontFamily = 'ProximaNova';

  /// A text style for bold Heading 1.
  ///
  /// This style is typically used for large and bold headings with a font size of 50,
  /// a bold font weight (w700), and a line height of 1. It creates a prominent and attention-grabbing heading.
  static const TextStyle heading1Bold =
      TextStyle(fontSize: size_50, fontWeight: FontWeight.w700, height: size_1);

  /// A text style for semi-bold Heading 1.
  ///
  /// This style is similar to [heading1Bold] but with a slightly lighter font weight (w600).
  /// It is suitable for headings that need to be prominent but not as bold as [heading1Bold].
  static const TextStyle heading1SemiBold =
      TextStyle(fontSize: size_50, fontWeight: FontWeight.w600, height: size_1);

  /// A text style for regular Heading 1.
  ///
  /// This style is typically used for standard heading 1 texts.
  /// It has a font size of 50, a normal font weight (w400), and a line height of 1.
  static const TextStyle heading1Regular =
      TextStyle(fontSize: size_50, fontWeight: FontWeight.w400, height: size_1);

  /// A text style for bold Heading 2.
  ///
  /// This style is typically used for headings with a font size of 33, a bold font weight (w700),
  /// and a line height of 1. It creates a bold and prominent heading.
  static const TextStyle heading2Bold =
      TextStyle(fontSize: size_33, fontWeight: FontWeight.w700, height: size_1);

  /// A text style for semi-bold Heading 2.
  ///
  /// This style is similar to [heading2Bold] but with a slightly lighter font weight (w600).
  /// It is suitable for headings that need to be prominent but not as bold as [heading2Bold].
  static const TextStyle heading2SemiBold =
      TextStyle(fontSize: size_33, fontWeight: FontWeight.w600, height: size_1);

  /// A text style for regular Heading 2.
  ///
  /// This style is typically used for standard heading 2 texts.
  /// It has a font size of 33, a normal font weight (w400), and a line height of 1.
  static const TextStyle heading2Regular =
      TextStyle(fontSize: size_33, fontWeight: FontWeight.w400, height: size_1);

  /// A text style for bold Heading 3.
  ///
  /// This style is typically used for headings with a font size of 22, a bold font weight (w700),
  /// and a line height of 1. It creates a bold and prominent heading.
  static const TextStyle heading3Bold =
      TextStyle(fontSize: size_22, fontWeight: FontWeight.w700, height: size_1);

  /// A text style for semi-bold Heading 3.
  ///
  /// This style is similar to [heading3Bold] but with a slightly lighter font weight (w600).
  /// It is suitable for headings that need to be prominent but not as bold as [heading3Bold].
  static const TextStyle heading3SemiBold =
      TextStyle(fontSize: size_22, fontWeight: FontWeight.w600, height: size_1);

  /// A text style for regular Heading 3.
  ///
  /// This style is typically used for standard heading 3 texts.
  /// It has a font size of 22, a normal font weight (w400), and a line height of 1.
  static const TextStyle heading3Regular =
      TextStyle(fontSize: size_22, fontWeight: FontWeight.w400, height: size_1);

  /// A text style for bold Heading 4.
  ///
  /// This style is typically used for headings with a font size of 20, a bold font weight (w700),
  /// and a line height of 1. It creates a bold and prominent heading.
  static const TextStyle heading4Bold =
      TextStyle(fontSize: size_20, fontWeight: FontWeight.w700, height: size_1);

  /// A text style for semi-bold Heading 4.
  ///
  /// This style is similar to [heading4Bold] but with a slightly lighter font weight (w600).
  /// It is suitable for headings that need to be prominent but not as bold as [heading4Bold].
  static const TextStyle heading4SemiBold =
      TextStyle(fontSize: size_20, fontWeight: FontWeight.w600, height: size_1);

  /// A text style for regular Heading 4.
  ///
  /// This style is typically used for standard heading 4 texts.
  /// It has a font size of 20, a normal font weight (w400), and a line height of 1.
  static const TextStyle heading4Regular =
      TextStyle(fontSize: size_20, fontWeight: FontWeight.w400, height: size_1);

  /// A text style for bold Heading 5.
  ///
  /// This style is typically used for headings with a font size of 18, a bold font weight (w700),
  /// and a line height of 1. It creates a bold and prominent heading.
  static const TextStyle heading5Bold =
      TextStyle(fontSize: size_18, fontWeight: FontWeight.w700, height: size_1);

  /// A text style for semi-bold Heading 5.
  ///
  /// This style is similar to [heading5Bold] but with a slightly lighter font weight (w600).
  /// It is suitable for headings that need to be prominent but not as bold as [heading5Bold].
  static const TextStyle heading5SemiBold =
      TextStyle(fontSize: size_18, fontWeight: FontWeight.w600, height: size_1);

  /// A text style for regular Heading 5.
  ///
  /// This style is typically used for standard heading 5 texts.
  /// It has a font size of 18, a normal font weight (w400), and a line height of 1.
  static const TextStyle heading5Regular =
      TextStyle(fontSize: size_18, fontWeight: FontWeight.w400, height: size_1);

  /// A text style for bold Heading 6.
  ///
  /// This style is typically used for headings with a font size of 17, a bold font weight (w700),
  /// and a line height of 1. It creates a bold and prominent heading.
  static const TextStyle heading6Bold =
      TextStyle(fontSize: size_17, fontWeight: FontWeight.w700, height: size_1);

  /// A text style for semi-bold Heading 6.
  ///
  /// This style is similar to [heading6Bold] but with a slightly lighter font weight (w600).
  /// It is suitable for headings that need to be prominent but not as bold as [heading6Bold].
  static const TextStyle heading6SemiBold =
      TextStyle(fontSize: size_17, fontWeight: FontWeight.w600, height: size_1);

  /// A text style for regular Heading 6.
  ///
  /// This style is typically used for standard heading 6 texts.
  /// It has a font size of 17, a normal font weight (w400), and a line height of 1.
  static const TextStyle heading6Regular =
      TextStyle(fontSize: size_17, fontWeight: FontWeight.w400, height: size_1);

  /// A text style for bold Heading 7.
  ///
  /// This style is typically used for headings with a font size of 15, a bold font weight (w700),
  /// and a line height of 1. It creates a bold and prominent heading.
  static const TextStyle heading7Bold =
      TextStyle(fontSize: size_15, fontWeight: FontWeight.w700, height: size_1);

  /// A text style for semi-bold Heading 7.
  ///
  /// This style is similar to [heading7Bold] but with a slightly lighter font weight (w600).
  /// It is suitable for headings that need to be prominent but not as bold as [heading7Bold].
  static const TextStyle heading7SemiBold =
      TextStyle(fontSize: size_15, fontWeight: FontWeight.w600, height: size_1);

  /// A text style for regular Heading 7.
  ///
  /// This style is typically used for standard heading 7 texts.
  /// It has a font size of 15, a normal font weight (w400), and a line height of 1.
  static const TextStyle heading7Regular =
      TextStyle(fontSize: size_15, fontWeight: FontWeight.w400, height: size_1);

  /// A text style for bold Heading 8.
  ///
  /// This style is typically used for headings with a font size of 13, a bold font weight (w700),
  /// and a line height of 1. It creates a bold and prominent heading.
  static const TextStyle heading8Bold =
      TextStyle(fontSize: size_13, fontWeight: FontWeight.w700, height: size_1);

  /// A text style for semi-bold Heading 8.
  ///
  /// This style is similar to [heading8Bold] but with a slightly lighter font weight (w600).
  /// It is suitable for headings that need to be prominent but not as bold as [heading8Bold].
  static const TextStyle heading8SemiBold =
      TextStyle(fontSize: size_13, fontWeight: FontWeight.w600, height: size_1);

  /// A text style for regular Heading 8.
  ///
  /// This style is typically used for standard heading 8 texts.
  /// It has a font size of 13, a normal font weight (w400), and a line height of 1.
  static const TextStyle heading8Regular =
      TextStyle(fontSize: size_13, fontWeight: FontWeight.w400, height: size_1);
}
