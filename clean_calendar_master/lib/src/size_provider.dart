import 'package:clean_calendar/src/models/calendar_properties.dart';

class DateSectionSizeProvider {
  // Private constructor
  DateSectionSizeProvider._internal();

  // Singleton instance
  static final DateSectionSizeProvider _instance =
      DateSectionSizeProvider._internal();

  // Getter to access the instance
  static DateSectionSizeProvider get instance => _instance;

  double _width = 0;
  double _height = 0;

  double get width => _width;
  double get height => _height;

  void updateSize(
    double width,
    double height,
  ) {
    _width = width;
    _height = height;
  }

  double maxHeightOfDateView(
    double? calendarDatesSectionMaxHeight,
  ) {
    return calendarDatesSectionMaxHeight == double.infinity ||
            calendarDatesSectionMaxHeight == null
        ? _height == double.infinity
            ? 240
            : _height
        : calendarDatesSectionMaxHeight;
  }

  double maxHeightOfDate(
    double? heightOfDateView,
    DatePickerCalendarView datePickerCalendarView,
  ) {
    if (datePickerCalendarView == DatePickerCalendarView.weekView) {
      return maxHeightOfDateView(heightOfDateView);
    }
    return maxHeightOfDateView(heightOfDateView) / 6;
  }

  double get widthOfDate {
    return (_width / 7) > 40 ? 40 : _width / 7;
  }
}
