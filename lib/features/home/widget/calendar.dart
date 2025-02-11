import 'package:capp_mobile/domain/model/ui_dto/event.dart';
import 'package:capp_mobile/features/home/provider/event_provider.dart';
import 'package:capp_mobile/features/home/provider/home_view_model.dart';
import 'package:capp_mobile/features/home/provider/selected_date_provider.dart';
import 'package:capp_mobile/features/home/provider/streak_date_provider.dart';
import 'package:capp_mobile/services/date_time_service.dart';
import 'package:capp_mobile/shared/theme/app_colors.dart';
import 'package:capp_mobile/shared/theme/app_dimens.dart';
import 'package:clean_calendar/clean_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Calendar extends ConsumerWidget {
  late HomeViewModel homeViewModel;
  late List<Event> eventsList;
  late Map<String, List<DateTime>> datesForStreak = {};
  DateTime datesForSelection = DateTime.now();

  Calendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    homeViewModel = ref.read(homeViewModelProvider);
    eventsList = ref.watch(eventProvider);
    datesForStreak = ref.watch(streakDateProvider);
    datesForSelection = ref.watch(selectedDateProvider);

    return Padding(
        padding: EdgeInsets.only(
            left: dimensions.spacingMedium,
            right: dimensions.spacingMedium
        ),
      child: CleanCalendar(
        moveToNextMonth: (int month){
          ref.read(homeViewModel.selectedMonth.notifier).state = month;
          homeViewModel.getEvents();
        },
        moveToPreviousMonth: (int month){
          ref.read(homeViewModel.selectedMonth.notifier).state = month;
          homeViewModel.getEvents();
        },
        calendarDatesSectionMaxHeight: 320,
        enableDenseSplashForDates: false,
        enableDenseViewForDates: false,

        //Header styling -- January 2025
        headerProperties: HeaderProperties(
            monthYearDecoration: MonthYearDecoration(
              monthYearTextStyle: Theme.of(context).textTheme.headlineMedium,
            ),
            navigatorDecoration: NavigatorDecoration(
                navigateLeftButtonIcon: Icon(Icons.keyboard_arrow_left),
                navigateRightButtonIcon: Icon(Icons.keyboard_arrow_right)
            )
        ),

        //Weekdays Styling -- Mon, Tues ...
        weekdaysProperties: WeekdaysProperties(
            generalWeekdaysDecoration: WeekdaysDecoration(
              weekdayTextColor: AppColors.darkFocusColor,
              weekdayTextStyle: Theme.of(context).textTheme.labelSmall,
            )
        ),

        //Selected dates as in current date or the one user will tap to select
        selectedDatesProperties: DatesProperties(
          datesDecoration: DatesDecoration(
              datesBackgroundColor: Theme.of(context).focusColor,
              datesTextStyle: Theme.of(context).textTheme.labelMedium,
              datesBorderRadius: dimensions.cornerRadiusTertiary,
              datesBorderColor: Theme.of(context).primaryColor,
            datesTextColor: Theme.of(context).primaryColor
          ),
        ),

        //Dates which are in selected dates list --- already have events on them
        streakDatesProperties: DatesProperties(
          datesDecorationBuilder: (DateTime date) {
            final selectedDate = eventsList.firstWhere((o) {
              return DateTimeService.isSameDate(o.startDate, date) ||
                  DateTimeService.isSameDate(o.endDate, date) ||
              DateTimeService.isDateInRange(dateToCheck: date, startDate: o.startDate, endDate: o.endDate);
            });
            return DatesDecoration(
              datesBackgroundColor: selectedDate.eventCategory.categoryColor,
              datesTextStyle: Theme.of(context).textTheme.labelMedium,
              datesBorderRadius: dimensions.cornerRadiusTertiary,
              datesBorderColor: selectedDate.eventCategory.categoryColor,
            );
          },
          // Will be used when for radius decors when a range of date is streaked
          datesDecoration: DatesDecoration(
              datesTextStyle: Theme.of(context).textTheme.labelMedium,
              datesBorderRadius: 360,
              datesTextColor: colorWhite
          ),
        ),

        //current date
        currentDateProperties: DatesProperties(
          datesDecoration: DatesDecoration(
              datesBackgroundColor: Theme.of(context).focusColor,
              datesTextStyle: Theme.of(context).textTheme.labelMedium,
              datesBorderRadius: dimensions.cornerRadiusTertiary,
              datesBorderColor: Theme.of(context).primaryColor
          ),
        ),

        //All dates in general except selected and current
        generalDatesProperties: DatesProperties(
            datesDecoration: DatesDecoration(
                datesBackgroundColor: Theme.of(context).focusColor,
                datesTextStyle: Theme.of(context).textTheme.labelMedium,
                datesBorderRadius: dimensions.cornerRadiusTertiary,
                datesBorderColor: Theme.of(context).focusColor
            )
        ),

        //Dates which are in display but of previous month or next month
        leadingTrailingDatesProperties: DatesProperties(
          datesDecoration: DatesDecoration(
              datesBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
              datesTextStyle: Theme.of(context).textTheme.labelMedium,
              datesBorderRadius: dimensions.cornerRadiusPrimary,
              datesBorderColor: Theme.of(context).scaffoldBackgroundColor
          ),
        ),

        datesForStreaks: datesForStreak,
        dateSelectionMode: DatePickerSelectionMode.singleOrMultiple,
        startWeekday: WeekDay.monday,
        selectedDates: [datesForSelection],
        onCalendarViewDate: (DateTime calendarViewDate) {},
        onSelectedDates: (List<DateTime> value) {
          homeViewModel.changeSelectedDate(value.first);
        },
      ),
    );
  }
}