import '../model/ui_dto/event.dart';

abstract class EventRepository {
  Future<List<Event>> getEvents();
}