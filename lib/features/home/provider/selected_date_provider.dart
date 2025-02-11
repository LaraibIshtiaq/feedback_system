import 'package:flutter_riverpod/flutter_riverpod.dart';

var selectedDateProvider = StateNotifierProvider.autoDispose<SelectedDateNotifier, DateTime>((ref) {
  return SelectedDateNotifier();
});

class SelectedDateNotifier extends StateNotifier<DateTime> {

  SelectedDateNotifier() : super(DateTime.now());

  changeSelectedDate(DateTime newSelectedDate){
    state = newSelectedDate;
  }
}
