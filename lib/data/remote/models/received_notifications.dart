import 'dart:math';

import 'package:capp_mobile/services/date_time_service.dart';

class ReceivedNotifications {
  final String senderId;
  // final String senderName;
  final String content;
  final bool isRead;
  final DateTime createdAt;

  ReceivedNotifications({
    required this.senderId,
    // required this.senderName,
    required this.content,
    required this.isRead,
    required this.createdAt,
  });

  // Convert JSON to NotificationModel object
  factory ReceivedNotifications.fromJson(Map<String, dynamic> json) {
    return ReceivedNotifications(
      senderId: json['senderId'],
      // senderName: json['senderName'],
      content: json['content'],
      isRead: (json['isRead'] ?? false) as bool,
      createdAt: DateTimeService.convertUtcToLocal(json['createdAt']),
    );
  }

  // Convert NotificationModel object to JSON
  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      // 'senderName': senderName,
      'content': content,
      'isRead': isRead,
      'createdAt': createdAt,
    };
  }
}
