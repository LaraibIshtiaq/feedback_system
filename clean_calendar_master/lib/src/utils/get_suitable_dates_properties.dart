import 'package:clean_calendar/src/models/calendar_properties.dart';
import 'package:clean_calendar/src/models/dates_properties.dart';

DatesProperties getSuitableDatesProperties({
  required CalendarProperties calendarProperties,
  required DateTime pageViewElementDate,
  required DateTime pageViewDate,
}) {
  if (calendarProperties.selectedDates.contains(pageViewElementDate)) {
    return calendarProperties.selectedDatesProperties;
  }
  else if (pageViewElementDate.month != pageViewDate.month) {
    return calendarProperties.leadingTrailingDatesProperties;
  }
  else if (pageViewElementDate == calendarProperties.currentDateOfCalendar) {
    for (var dateList in calendarProperties.datesForStreaks!.values) {
      if (dateList.contains(pageViewElementDate)) {
        return calendarProperties.streakDatesProperties.copyWith(
            datesDecoration: calendarProperties.streakDatesProperties
                .datesDecoration?.copyWith(
              datesTextColor: calendarProperties
                  .currentDateProperties.datesDecoration?.datesTextColor,
              datesBorderColor: calendarProperties
                  .currentDateProperties.datesDecoration?.datesBorderColor,
              datesTextStyle: calendarProperties
                  .currentDateProperties.datesDecoration?.datesTextStyle,
            ),
            datesDecorationBuilder: calendarProperties.streakDatesProperties
                .datesDecorationBuilder);
      }
      else {
        return calendarProperties.currentDateProperties;
      }
    }
  }

  for (var dateList in calendarProperties.datesForStreaks!.values) {
    if(dateList.contains(pageViewElementDate)){
      return calendarProperties.streakDatesProperties;
    }
  }
  return calendarProperties.generalDatesProperties;
}
