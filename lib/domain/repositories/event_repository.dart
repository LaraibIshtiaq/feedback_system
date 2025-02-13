import 'package:capp_mobile/data/remote/models/event.dart';

abstract class EventRepository {
  Future<List<Event>> getEvents(String projectId, int month);

  Future<Event?> addEvent(Map<String, dynamic> data);

  Future<int?> deleteEvent(String eventId);

  Future<Event?> updateEvent(String eventId, Map<String, dynamic> data);
}