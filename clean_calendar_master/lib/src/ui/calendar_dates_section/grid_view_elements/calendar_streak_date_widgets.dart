import 'package:clean_calendar/src/models/calendar_properties.dart';
import 'package:clean_calendar/src/models/dates_properties.dart';
import 'package:clean_calendar/src/size_provider.dart';
import 'package:clean_calendar/src/utils/get_end_weekday_from_start_weekday.dat.dart';
import 'package:clean_calendar/src/utils/get_suitable_dates_on_tap.dart';
import 'package:clean_calendar/src/utils/get_suitable_dates_properties.dart';
import 'package:clean_calendar/src/utils/get_widget_center_offset_info.dart';
import 'package:clean_calendar/src/utils/simulate_tap_on_an_offset.dart';
import 'package:clean_calendar/src/utils/space_fixer.dart';
import 'package:flutter/material.dart';

/// Only use Ink if its parent is a button otherwise it will act weird such as
/// this https://github.com/flutter/flutter/issues/73315. Use space fixer
/// between containers of same color to fix lines due to antialiasing will be
/// fixed with impeller in future.
class CalendarStreakStartExpandedDate extends StatelessWidget {
  const CalendarStreakStartExpandedDate(
      {super.key,
      required this.calendarProperties,
      required this.pageViewElementDate,
      required this.pageViewDate});

  final CalendarProperties calendarProperties;
  final DateTime pageViewElementDate;
  final DateTime pageViewDate;

  @override
  Widget build(BuildContext context) {
    final Function()? dateSuitableDatesOnTap = getSuitableDatesOnTap(
      calendarProperties: calendarProperties,
      pageViewElementDate: pageViewElementDate,
    );

    final DatesProperties datesProperties = getSuitableDatesProperties(
      calendarProperties: calendarProperties,
      pageViewElementDate: pageViewElementDate,
      pageViewDate: pageViewDate,
    );

    final int endWeekday = getEndWeekdayFromStartWeekday(
        startWeekday: getIntFromWeekday(calendarProperties.startWeekday));

    Color? datesBackgroundColor;
    Color? datesBorderColor;
    if(datesProperties.datesDecorationBuilder != null){
      datesBackgroundColor =
          datesProperties.datesDecorationBuilder!(pageViewElementDate).datesBackgroundColor;
      datesBorderColor =
          datesProperties.datesDecorationBuilder!(pageViewElementDate).datesBorderColor;
    }
    else{
      datesBorderColor = datesProperties.datesDecoration?.datesBorderColor;
      datesBackgroundColor = datesProperties.datesDecoration?.datesBackgroundColor;
    }
    Color? datesTextColor = datesProperties.datesDecoration?.datesTextColor;
    TextStyle? datesTextStyle = datesProperties.datesDecoration?.datesTextStyle;
    double? datesBorderRadius =
        datesProperties.datesDecoration?.datesBorderRadius;
    bool hide = datesProperties.hide ?? false;
    bool disable = datesProperties.disable ?? false;

    return !hide
        ? InkResponse(
            containedInkWell: true,
            highlightShape: BoxShape.rectangle,
            customBorder: datesBorderRadius != null
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(datesBorderRadius),
                        bottomLeft: Radius.circular(datesBorderRadius)),
                  )
                : null,
            splashFactory: InkRipple.splashFactory,
            onTap: disable ? null : dateSuitableDatesOnTap,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 4,
                  bottom: 4,
                  left: 4,
                  right: pageViewElementDate.weekday == endWeekday ? 4 : 0),
              child: Container(
                //Replace here with Ink after this fix https://github.com/flutter/flutter/issues/73315
                decoration: BoxDecoration(
                  border: datesBorderColor != null
                      ? Border(
                          top: BorderSide(color: datesBorderColor, width: 1),
                          bottom: BorderSide(color: datesBorderColor, width: 1),
                          left: BorderSide(color: datesBorderColor, width: 1),
                          right: BorderSide(color: datesBorderColor, width: 1),
                        )
                      : null,
                  borderRadius: datesBorderRadius != null
                      ? BorderRadius.only(
                          topLeft: Radius.circular(datesBorderRadius),
                          bottomLeft: Radius.circular(datesBorderRadius))
                      : null,
                  color: datesBackgroundColor,
                ),
                child: Center(
                  child: Text(
                    //TODO: CHECK HERE
                    pageViewElementDate.day.toString(),
                    style: datesTextStyle != null
                        ? datesTextStyle.copyWith(
                            color: datesTextColor,
                          )
                        : TextStyle(color: datesTextColor),
                  ),
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}

class CalendarStreakBetweenExpandedDate extends StatelessWidget {
  const CalendarStreakBetweenExpandedDate(
      {super.key,
      required this.calendarProperties,
      required this.pageViewElementDate,
      required this.pageViewDate});

  final CalendarProperties calendarProperties;
  final DateTime pageViewElementDate;
  final DateTime pageViewDate;

  @override
  Widget build(BuildContext context) {
    final Function()? dateSuitableDatesOnTap = getSuitableDatesOnTap(
      calendarProperties: calendarProperties,
      pageViewElementDate: pageViewElementDate,
    );

    final DatesProperties datesProperties = getSuitableDatesProperties(
      calendarProperties: calendarProperties,
      pageViewElementDate: pageViewElementDate,
      pageViewDate: pageViewDate,
    );

    final int startWeekday = getIntFromWeekday(calendarProperties.startWeekday);

    final int endWeekday =
        getEndWeekdayFromStartWeekday(startWeekday: startWeekday);

    Color? datesBackgroundColor;
    Color? datesBorderColor;
    if(datesProperties.datesDecorationBuilder != null){
      datesBackgroundColor =
          datesProperties.datesDecorationBuilder!(pageViewElementDate).datesBackgroundColor;
      datesBorderColor =
          datesProperties.datesDecorationBuilder!(pageViewElementDate).datesBorderColor;
    }
    else{
      datesBorderColor = datesProperties.datesDecoration?.datesBorderColor;
      datesBackgroundColor = datesProperties.datesDecoration?.datesBackgroundColor;
    }

    Color? datesTextColor = datesProperties.datesDecoration?.datesTextColor;
    TextStyle? datesTextStyle = datesProperties.datesDecoration?.datesTextStyle;
    bool hide = datesProperties.hide ?? false;
    bool disable = datesProperties.disable ?? false;

    return !hide
        ? InkResponse(
            containedInkWell: true,
            highlightShape: BoxShape.rectangle,
            customBorder: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
            splashFactory: InkRipple.splashFactory,
            onTap: disable ? null : dateSuitableDatesOnTap,
            child: Container(
              margin: EdgeInsets.only(
                top: 4,
                bottom: 4,
                right: pageViewElementDate.weekday == endWeekday ? 4 : 0,
                left: pageViewElementDate.weekday == startWeekday ? 4 : 0,
              ),
              child: Container(
                //Replace here with Ink after this fix https://github.com/flutter/flutter/issues/73315
                decoration: BoxDecoration(
                  border: datesBorderColor != null
                      ? Border.symmetric(
                          horizontal:
                              BorderSide(color: datesBorderColor, width: 1))
                      : null,
                  color: datesBackgroundColor,
                ),
                child: Container(
                  margin: EdgeInsets.only(
                    right: pageViewElementDate.weekday == startWeekday ? 4 : 0,
                    left: pageViewElementDate.weekday == endWeekday ? 4 : 0,
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Center(
                        child: Text(
                          pageViewElementDate.day.toString(),
                          style: datesTextStyle != null
                              ? datesTextStyle.copyWith(
                                  color: datesTextColor,
                                )
                              : TextStyle(color: datesTextColor),
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}

class CalendarStreakEndExpandedDate extends StatelessWidget {
  const CalendarStreakEndExpandedDate(
      {super.key,
      required this.calendarProperties,
      required this.pageViewElementDate,
      required this.pageViewDate});

  final CalendarProperties calendarProperties;
  final DateTime pageViewElementDate;
  final DateTime pageViewDate;

  @override
  Widget build(BuildContext context) {
    final Function()? dateSuitableDatesOnTap = getSuitableDatesOnTap(
      calendarProperties: calendarProperties,
      pageViewElementDate: pageViewElementDate,
    );

    final DatesProperties datesProperties = getSuitableDatesProperties(
      calendarProperties: calendarProperties,
      pageViewElementDate: pageViewElementDate,
      pageViewDate: pageViewDate,
    );

    final int startWeekday = getIntFromWeekday(calendarProperties.startWeekday);
    Color? datesBackgroundColor;
    Color? datesBorderColor;
    if(datesProperties.datesDecorationBuilder != null){
      datesBackgroundColor =
          datesProperties.datesDecorationBuilder!(pageViewElementDate).datesBackgroundColor;
      datesBorderColor =
          datesProperties.datesDecorationBuilder!(pageViewElementDate).datesBorderColor;
    }
    else{
      datesBorderColor = datesProperties.datesDecoration?.datesBorderColor;
      datesBackgroundColor = datesProperties.datesDecoration?.datesBackgroundColor;
    }

    Color? datesTextColor = datesProperties.datesDecoration?.datesTextColor;
    TextStyle? datesTextStyle = datesProperties.datesDecoration?.datesTextStyle;
    double? datesBorderRadius =
        datesProperties.datesDecoration?.datesBorderRadius;
    bool hide = datesProperties.hide ?? false;
    bool disable = datesProperties.disable ?? false;

    return !hide
        ? InkResponse(
            containedInkWell: true,
            highlightShape: BoxShape.rectangle,
            customBorder: datesBorderRadius != null
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(datesBorderRadius),
                        bottomRight: Radius.circular(datesBorderRadius)),
                  )
                : null,
            splashFactory: InkRipple.splashFactory,
            onTap: disable ? null : dateSuitableDatesOnTap,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 4,
                  bottom: 4,
                  right: 4,
                  left: pageViewElementDate.weekday == startWeekday ? 4 : 0),
              child: Container(
                //Replace here with Ink after this fix https://github.com/flutter/flutter/issues/73315
                decoration: BoxDecoration(
                  border: datesBorderColor != null
                      ? Border(
                          top: BorderSide(color: datesBorderColor, width: 1),
                          bottom: BorderSide(color: datesBorderColor, width: 1),
                          left: BorderSide(color: datesBorderColor, width: 1),
                          right: BorderSide(color: datesBorderColor, width: 1),
                        )
                      : null,
                  borderRadius: datesBorderRadius != null
                      ? BorderRadius.only(
                          topRight: Radius.circular(datesBorderRadius),
                          bottomRight: Radius.circular(datesBorderRadius))
                      : null,
                  color: datesBackgroundColor,
                ),
                child: Center(
                  child: Text(
                    //TODO: CHECK HERE
                    pageViewElementDate.day.toString(),
                    style: datesTextStyle != null
                        ? datesTextStyle.copyWith(
                            color: datesTextColor,
                          )
                        : TextStyle(color: datesTextColor),
                  ),
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}

class CalendarStreakSingleExpandedDate extends StatelessWidget {
  const CalendarStreakSingleExpandedDate(
      {super.key,
      required this.calendarProperties,
      required this.pageViewElementDate,
      required this.pageViewDate});

  final CalendarProperties calendarProperties;
  final DateTime pageViewElementDate;
  final DateTime pageViewDate;

  @override
  Widget build(BuildContext context) {
    final Function()? dateSuitableDatesOnTap = getSuitableDatesOnTap(
      calendarProperties: calendarProperties,
      pageViewElementDate: pageViewElementDate,
    );

    final DatesProperties datesProperties = getSuitableDatesProperties(
      calendarProperties: calendarProperties,
      pageViewElementDate: pageViewElementDate,
      pageViewDate: pageViewDate,
    );

    Color? datesBackgroundColor;
    Color? datesBorderColor;
    double? datesBorderRadius;
    if(datesProperties.datesDecorationBuilder != null){
      datesBackgroundColor =
          datesProperties.datesDecorationBuilder!(pageViewElementDate).datesBackgroundColor;
      datesBorderColor =
          datesProperties.datesDecorationBuilder!(pageViewElementDate).datesBorderColor;
      datesBorderRadius =
          datesProperties.datesDecorationBuilder!(pageViewElementDate).datesBorderRadius;
    }
    else{
      datesBorderColor = datesProperties.datesDecoration?.datesBorderColor;
      datesBackgroundColor = datesProperties.datesDecoration?.datesBackgroundColor;
      datesBorderRadius = datesProperties.datesDecoration?.datesBorderRadius;
    }
    Color? datesTextColor = datesProperties.datesDecoration?.datesTextColor;
    TextStyle? datesTextStyle = datesProperties.datesDecoration?.datesTextStyle;

    bool hide = datesProperties.hide ?? false;
    bool disable = datesProperties.disable ?? false;

    return !hide
        ? InkResponse(
            containedInkWell: true,
            highlightShape: BoxShape.rectangle,
            customBorder: datesBorderRadius != null
                ? RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(datesBorderRadius)),
                  )
                : null,
            splashFactory: InkRipple.splashFactory,
            onTap: disable ? null : dateSuitableDatesOnTap,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                //Replace here with Ink after this fix https://github.com/flutter/flutter/issues/73315
                decoration: BoxDecoration(
                  border: datesBorderColor != null
                      ? Border.all(color: datesBorderColor, width: 1)
                      : null,
                  borderRadius: datesBorderRadius != null
                      ? BorderRadius.all(Radius.circular(datesBorderRadius))
                      : null,
                  color: datesBackgroundColor,
                ),
                child: Center(
                  child: Text(
                    //TODO: CHECK HERE
                    pageViewElementDate.day.toString(),
                    style: datesTextStyle != null
                        ? datesTextStyle.copyWith(
                            color: datesTextColor,
                          )
                        : TextStyle(color: datesTextColor),
                  ),
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}