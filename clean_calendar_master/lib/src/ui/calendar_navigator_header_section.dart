import 'package:clean_calendar/src/models/calendar_properties.dart';
import 'package:clean_calendar/src/state/page_controller.dart';
import 'package:flutter/material.dart';

class CalendarNavigatorHeaderSection extends StatelessWidget {
  const CalendarNavigatorHeaderSection(
      {super.key,
      required this.calendarProperties,
      required this.pageControllerState});

  final CalendarProperties calendarProperties;
  final PageControllerState pageControllerState;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageControllerState,
      builder: (BuildContext context, Widget? child) {
        final DateTime pageViewDateTime = pageControllerState.pageViewDateTime;
        final List<String> monthsSymbolsList = [];
        calendarProperties.monthsSymbol.toMap().forEach((key, value) {
          monthsSymbolsList.add(value);
        });

        Icon navigateLeftButtonIcon = calendarProperties
                .headerProperties.navigatorDecoration?.navigateLeftButtonIcon ??
            const Icon(
              Icons.arrow_back_ios,
              size: 12,
            );

        Icon navigateRightButtonIcon = calendarProperties.headerProperties
                .navigatorDecoration?.navigateRightButtonIcon ??
            const Icon(
              Icons.arrow_forward_ios,
              size: 12,
            );

        Color? monthYearTextColor = calendarProperties
            .headerProperties.monthYearDecoration?.monthYearTextColor;

        TextStyle? monthYearTextStyle = calendarProperties
                .headerProperties.monthYearDecoration?.monthYearTextStyle ??
            Theme.of(context).textTheme.titleSmall;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                pageControllerState.pageController.previousPage(
                    duration: kTabScrollDuration, curve: Curves.ease);
                calendarProperties.moveToNextMonth(pageViewDateTime.month - 1);
              },
              icon: navigateLeftButtonIcon,
            ),
            Text(
              "${monthsSymbolsList[pageViewDateTime.month - 1]} ${pageViewDateTime.year}",
              overflow: TextOverflow.ellipsis,
              style: monthYearTextColor != null
                  ? monthYearTextStyle?.copyWith(color: monthYearTextColor)
                  : monthYearTextStyle,
            ),
            IconButton(
              onPressed: () {
                pageControllerState.pageController.nextPage(
                    duration: kTabScrollDuration, curve: Curves.ease);
                calendarProperties.moveToNextMonth(pageViewDateTime.month + 1);
              },
              icon: navigateRightButtonIcon,
            ),
          ],
        );
      },
    );
  }
}
