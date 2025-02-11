import 'package:capp_mobile/domain/model/ui_dto/event_category.dart';
import 'package:capp_mobile/domain/model/ui_dto/feedback.dart';
import 'package:capp_mobile/services/date_time_service.dart';

class Event{
  String? eventId; //Null-able cuz id wont be there at time of creation request
  String projectId;
  String projectName;
  String eventName;
  DateTime startDate;
  DateTime endDate;
  String eventNote;
  EventCategory eventCategory;
  List<EventFeedback>? feedbacks;

  Event({
    this.eventId,
    required this.projectId,
    required this.projectName,
    required this.eventName,
    required this.startDate,
    required this.endDate,
    required this.eventNote,
    required this.eventCategory,
    this.feedbacks
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventId: json['id']??"",
      projectId: json['projectId']??0,
      projectName: json['projectName']??"",
      eventName: json['eventName']??"",
      startDate: DateTimeService.parseUtcDateTime(json['startDate']),
      endDate: DateTimeService.parseUtcDateTime(json['endDate']),
      eventNote: json['eventNote']??"",
      eventCategory: EventCategory.fromString(json["eventCategory"]),
      feedbacks: (json["feedbacks"] != null) ?
      (json["feedbacks"] as List<dynamic>)
          .map((e) => EventFeedback.fromJson(e))
          .toList() : null,
    );
  }

  Map<String, dynamic> toJson(Event event){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['projectId'] = event.projectId;
    data['projectName'] = event.projectName;
    data['eventName'] = event.eventName;
    data['eventCategory'] = event.eventCategory.categoryName;
    data['startDate'] = DateTimeService.convertToUTC(event.startDate);
    data['endDate'] = DateTimeService.convertToUTC(event.endDate);
    data['eventNote'] = event.eventNote;
    return data;
  }
}