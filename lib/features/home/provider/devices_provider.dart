import 'package:capp_mobile/domain/model/ui_dto/event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var eventProvider = StateNotifierProvider.autoDispose<EventNotifier, List<Event>>
  ((ref) => EventNotifier());

class EventNotifier extends StateNotifier<List<Event>> {
  EventNotifier(): super([]);

  void addEvent(Event event) {
    state.add(event);
  }

  void removeEvent(int eventId) {
    state.removeWhere((element) => element.eventId == eventId);
    state = List.from(state);
  }

  void replaceAllEvents(List<Event> newEvents) {
    state = newEvents;
  }
}