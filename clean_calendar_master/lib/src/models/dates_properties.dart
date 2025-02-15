import 'package:clean_calendar/src/models/dates_decoration.dart';

class DatesProperties {
  /// - datesDecoration, changes the dates decoration.
  final DatesDecoration? datesDecoration;

  /// - disable, disable dates.
  final bool? disable;

  /// - hide, hide dates.
  final bool? hide;

  /// - datesDecorationBuilder, dynamically determines decoration based on the date.
  final DatesDecoration Function(DateTime)? datesDecorationBuilder;

  DatesProperties({
    this.datesDecoration,
    this.disable,
    this.hide,
    this.datesDecorationBuilder,
  });

  /// Creates a copy of DatesProperties object with the given
  /// values replaced with new values.
  DatesProperties copyWith({
    DatesDecoration? datesDecoration,
    bool? disable,
    bool? hide,
    DatesDecoration Function(DateTime)? datesDecorationBuilder,
  }) {
    return DatesProperties(
      datesDecoration: datesDecoration ?? this.datesDecoration,
      disable: disable ?? this.disable,
      hide: hide ?? this.hide,
      datesDecorationBuilder:
      datesDecorationBuilder ?? this.datesDecorationBuilder,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DatesProperties &&
              runtimeType == other.runtimeType &&
              datesDecoration == other.datesDecoration &&
              disable == other.disable &&
              hide == other.hide &&
              datesDecorationBuilder == other.datesDecorationBuilder;

  @override
  int get hashCode =>
      datesDecoration.hashCode ^
      disable.hashCode ^
      hide.hashCode ^
      datesDecorationBuilder.hashCode;

  @override
  String toString() {
    return 'DatesProperties{decorationProperties: $datesDecoration, disable: $disable, hide: $hide, datesDecorationBuilder: $datesDecorationBuilder}';
  }
}


// class DatesProperties {
//   /// - datesDecoration, changes the dates decoration.
//   final DatesDecoration? datesDecoration;
//
//   /// - disable, disable dates.
//   final bool? disable;
//
//   /// - hide, hide dates.
//   final bool? hide;
//
//   DatesProperties({
//     this.datesDecoration,
//     this.disable,
//     this.hide,
//   });
//
//   /// Creates copy of DatesProperties object with the given
//   /// values replaced with new values.
//   DatesProperties copyWith({
//     DatesDecoration? datesDecoration,
//     bool? disable,
//     bool? hide,
//   }) {
//     return DatesProperties(
//       datesDecoration: datesDecoration ?? this.datesDecoration,
//       disable: disable ?? this.disable,
//       hide: hide ?? this.hide,
//     );
//   }
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is DatesProperties &&
//           runtimeType == other.runtimeType &&
//           datesDecoration == other.datesDecoration &&
//           disable == other.disable &&
//           hide == other.hide;
//
//   @override
//   int get hashCode =>
//       datesDecoration.hashCode ^ disable.hashCode ^ hide.hashCode;
//
//   // Implement toString to make it easier to see information
//   // when using the print statement.
//   @override
//   String toString() {
//     return 'DatesProperties{decorationProperties: $datesDecoration, disable: $disable, hide: $hide}';
//   }
// }
