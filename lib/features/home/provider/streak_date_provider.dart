import 'package:capp_mobile/services/date_time_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var streakDateProvider = StateNotifierProvider.autoDispose<StreakDateNotifier, Map<String, List<DateTime>>>((ref) {
  return StreakDateNotifier();
});

class StreakDateNotifier extends StateNotifier<Map<String, List<DateTime>>> {

  StreakDateNotifier() : super({});

  removeStreakedDates(){
    state = {};
  }


  void addDatesInList(eventsList) {
    final updatedState = Map<String, List<DateTime>>.from(state);

    for (var event in eventsList) {
      final categoryId = event.eventCategory.categoryId.toString();

      // Check if this event category already exists in the map
      if (updatedState[categoryId] != null) {
        final currentStreakedDates = updatedState[categoryId]!;

        if (!event.startDate.isAtSameMomentAs(event.endDate)) {
          // Add all dates between start and end, inclusive
          List<DateTime> inBetweenDates = DateTimeService.getDatesBetweenTwoDatesWithEnds(
            startDate: event.startDate,
            endDate: event.endDate,
          );
          for (var date in inBetweenDates) {
            if (!currentStreakedDates.contains(date)) {
              currentStreakedDates.add(date);
            }
          }
        } else {
          // Add startDate if it's not already in the list
          if (!currentStreakedDates.contains(event.startDate)) {
            currentStreakedDates.add(event.startDate);
          }
        }

        updatedState[categoryId] = currentStreakedDates;
      } else {
        // If category is not already present, create a new list for it
        if (event.startDate.isAtSameMomentAs(event.endDate)) {
          updatedState[categoryId] = [event.startDate];
        } else {
          List<DateTime> dates = DateTimeService.getDatesBetweenTwoDatesWithEnds(
            startDate: event.startDate,
            endDate: event.endDate,
          );
          updatedState[categoryId] = dates;
        }
      }
    }
    state = updatedState; // Reassign state to a new map instance
  }
}
