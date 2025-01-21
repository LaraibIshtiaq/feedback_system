import 'package:capp_mobile/domain/model/ui_dto/event_category.dart';

class Event{
  int eventId;
  String eventName;
  String startDate;
  String endDate;
  String eventNote;
  EventCategory eventCategory;

  Event({
    required this.eventId,
    required this.eventName,
    required this.startDate,
    required this.endDate,
    required this.eventNote,
    required this.eventCategory
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventId: json['id']??"",
      eventName: json['title']??"",
      startDate: json['start_date']??"",
      endDate: json['end_date']??"",
      eventNote: json['note']??"",
      eventCategory: EventCategory.fromJson(json["category"])
    );
  }
}