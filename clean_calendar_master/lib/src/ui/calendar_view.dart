import 'package:clean_calendar/src/models/calendar_properties.dart';
import 'package:clean_calendar/src/state/page_controller.dart';
import 'package:clean_calendar/src/ui/calendar_navigator_header_section.dart';
import 'package:clean_calendar/src/ui/calendar_dates_section/calendar_dates_section.dart';
import 'package:clean_calendar/src/ui/calendar_weekday_header_section.dart';
import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key, required this.calendarProperties});

  final CalendarProperties calendarProperties;

  @override
  Widget build(BuildContext context) {
    return CalendarView(calendarProperties: calendarProperties);
  }
}

class CalendarView extends StatefulWidget {
  const CalendarView({super.key, required this.calendarProperties});

  final CalendarProperties calendarProperties;

  @override
  State<CalendarView> createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  late PageControllerState pageControllerState;

  @override
  void initState() {
    pageControllerState = PageControllerState(widget.calendarProperties)
      ..init();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CalendarView oldWidget) {
    if (oldWidget.calendarProperties.initialViewMonthDateTime !=
            widget.calendarProperties.initialViewMonthDateTime ||
        oldWidget.calendarProperties.startDateOfCalendar !=
            widget.calendarProperties.startDateOfCalendar ||
        oldWidget.calendarProperties.endDateOfCalendar !=
            widget.calendarProperties.endDateOfCalendar ||
        oldWidget.calendarProperties.datePickerCalendarView !=
            widget.calendarProperties.datePickerCalendarView) {
      setState(() {
        pageControllerState = PageControllerState(widget.calendarProperties)
          ..init();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CalendarNavigatorHeaderSection(
            calendarProperties: widget.calendarProperties,
            pageControllerState: pageControllerState),
        ListView(
          shrinkWrap: true,
          children: [
            CalendarWeekdayHeaderSection(
                calendarProperties: widget.calendarProperties),
            CalendarDatesSection(
                calendarProperties: widget.calendarProperties,
                pageControllerState: pageControllerState),
          ],
        ),


      ],
    );
  }
}
