import 'package:capp_mobile/data/remote/models/received_notifications.dart';

abstract class NotificationsRepository {
  Future<bool> addNotifications(Map<String, dynamic> data);

  Future<List<ReceivedNotifications>> getInboxNotifications(String userId);

  Future<List<ReceivedNotifications>> getOutboxNotifications(String userId);
}