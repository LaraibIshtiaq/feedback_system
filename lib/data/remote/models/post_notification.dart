import 'package:capp_mobile/domain/model/ui_dto/event_category.dart';
import 'package:capp_mobile/data/remote/models/feedback.dart';
import 'package:capp_mobile/domain/model/ui_dto/team_member.dart';
import 'package:capp_mobile/services/date_time_service.dart';

class PostNotification{
  String content;
  List<TeamMember> recipients;

  PostNotification({
    required this.content,
    required this.recipients,
  });

  factory PostNotification.fromJson(Map<String, dynamic> json) {
    return PostNotification(
      content: json['content']??"",
      recipients: (json["recipients"] as List<dynamic>)
          .map((e) => TeamMember.fromJson(e))
          .toList()
    );
  }

  Map<String, dynamic> toJson(PostNotification postNotification){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['content'] = postNotification.content;
    data['recipients'] = recipients.map((e) => e.toJsonForNotificationPostCall(e)).toList();
    return data;
  }
}