import 'dart:developer';

import 'package:capp_mobile/core/response.dart';
import 'package:capp_mobile/data/remote/models/feedback.dart';
import 'package:capp_mobile/data/remote/models/received_notifications.dart';
import 'package:capp_mobile/domain/repositories/notifications_repository.dart';
import 'package:dartz/dartz.dart';

import '../remote/dio_network_service.dart';

class NotificationsRepositoryImpl extends NotificationsRepository{

  final DioNetworkService networkService;

  NotificationsRepositoryImpl(this.networkService);

  @override
  Future<List<ReceivedNotifications>> getInboxNotifications(String userId) async {
    final res = await networkService
        .get("/Notification/GetInboxMessages/$userId");
    if (res is Left) {
      log("Error occurred in getNotifications");
      return [];
    }
    else {
      final data = ((res as Right).value as Response).data;
      if (data is List) {
        return data.map((e) => ReceivedNotifications.fromJson(e)).toList();
      }
      else {
        return [];
      }
    }
  }

  @override
  Future<bool> addNotifications(Map<String, dynamic> data) async {
    final res = await networkService.post("/Notification/add-message",
        data: data
    );

    if (res is Left) {
      log("Error occurred in addNotifications");
      return false;
    }
    else {
      final code = ((res as Right).value as Response).statusCode;
      return code == 201;
    }
  }

  @override
  Future<List<ReceivedNotifications>> getOutboxNotifications(String userId) {
    // TODO: implement getOutboxNotifications
    throw UnimplementedError();
  }
}