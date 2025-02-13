import 'package:capp_mobile/data/remote/models/event.dart';
import 'package:capp_mobile/data/remote/models/received_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var notificationProvider = StateNotifierProvider<NotificationNotifier, List<ReceivedNotifications>>((ref) {
  return NotificationNotifier();});

class NotificationNotifier extends StateNotifier<List<ReceivedNotifications>> {

  NotificationNotifier(): super([]);

  void addReceivedNotifications(ReceivedNotifications notification) {
    state.add(notification);
  }

  void replaceAllReceivedNotifications(List<ReceivedNotifications> notifications) {
    state = notifications;
  }

  removeAllReceivedNotifications(){
    state = [];
  }
}

