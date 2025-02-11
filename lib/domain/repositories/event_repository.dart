import 'package:capp_mobile/domain/model/ui_dto/event.dart';

abstract class EventRepository {
  Future<List<Event>> getEvents(String projectId, int month);

  Future<Event?> addEvent(Map<String, dynamic> data);

  Future<int?> deleteEvent(String eventId);

  Future<Event?> updateEvent(String eventId, Map<String, dynamic> data);
}