import 'package:capp_mobile/domain/model/ui_dto/event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var eventProvider = StateNotifierProvider.autoDispose<EventNotifier, List<Event>>((ref) {
    return EventNotifier();});

class EventNotifier extends StateNotifier<List<Event>> {

  EventNotifier(): super([]);

  void addEvent(Event event) {
    state.add(event);
  }

  void removeEvent(String eventId) {
    state.removeWhere((element) => eventId == element.eventId);
    state = List.from(state);
  }

  void replaceAllEvents(List<Event> newEvents) {
    state = newEvents;
  }

  removeAllEvents(){
    state = [];
  }
}

