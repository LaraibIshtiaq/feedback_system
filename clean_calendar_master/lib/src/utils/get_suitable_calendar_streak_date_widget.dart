import 'package:clean_calendar/src/models/calendar_properties.dart';
import 'package:clean_calendar/src/ui/calendar_dates_section/grid_view_elements/calendar_streak_date_widgets.dart';
import 'package:flutter/material.dart';

class GetSuitableCalendarStreakDateWidget extends StatelessWidget {
  const GetSuitableCalendarStreakDateWidget(
      {super.key,
      required this.calendarProperties,
      required this.pageViewElementDate,
      required this.pageViewDate});

  final CalendarProperties calendarProperties;
  final DateTime pageViewElementDate;
  final DateTime pageViewDate;

  bool _hasEventOfSameCategoryAfter(DateTime date) {
    String eventId = findKeyForDate(date) ?? "";
    final nextDate = date.add(Duration(days: 1));
    return calendarProperties.datesForStreaks![eventId]!.contains(nextDate);
  }

  bool _hasEventOfSameCategoryBefore(DateTime date) {
    String eventId = findKeyForDate(date) ?? "";
    final previousDate = date.subtract(Duration(days: 1));
    return calendarProperties.datesForStreaks![eventId]!.contains(previousDate);
  }

  bool _hasEventOfSameCategoryBeforeAndAfter(DateTime date) {
    String eventId = findKeyForDate(date) ?? "";
    final nextDate = date.add(Duration(days: 1));
    final previousDate = date.subtract(Duration(days: 1));
    return calendarProperties.datesForStreaks![eventId]!.contains(nextDate) &&
        calendarProperties.datesForStreaks![eventId]!.contains(previousDate);
  }


  String? findKeyForDate( DateTime targetDate) {
    return calendarProperties.datesForStreaks?.entries.firstWhere(
          (entry) => entry.value.any((date) => date == targetDate)
    ).key;
  }

  @override
  Widget build(BuildContext context) {
    /// Called when streak date have streak date just before and just after also.
    if (_hasEventOfSameCategoryBeforeAndAfter(pageViewElementDate)){
      if (!calendarProperties.enableDenseViewForDates) {
        return CalendarStreakBetweenExpandedDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      } else {
        return const SizedBox();
      }
    }

    /// Called when streak date have a streak date just after.
    if(_hasEventOfSameCategoryAfter(pageViewElementDate)){
      if (!calendarProperties.enableDenseViewForDates) {
        return CalendarStreakStartExpandedDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      } else {
        return const SizedBox();
      }
    }

    /// Called when streak date have a streak date just before.
    if(_hasEventOfSameCategoryBefore(pageViewElementDate)){
      if (!calendarProperties.enableDenseViewForDates) {
        return CalendarStreakEndExpandedDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      } else {
        return const SizedBox();
      }
    }

    /// Called when streak date doesn't have streak date just before and just after also.
    if(!_hasEventOfSameCategoryBefore(pageViewElementDate)
        && !_hasEventOfSameCategoryAfter(pageViewElementDate)) {
      if (!calendarProperties.enableDenseViewForDates) {
        return CalendarStreakSingleExpandedDate(
          calendarProperties: calendarProperties,
          pageViewElementDate: pageViewElementDate,
          pageViewDate: pageViewDate,
        );
      } else {
        return const SizedBox();
      }
    }
    else {
      return const SizedBox();
    }
  }
}
