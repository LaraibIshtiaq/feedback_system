import 'dart:developer';

import 'package:capp_mobile/core/response.dart';
import 'package:capp_mobile/domain/model/ui_dto/feedback.dart';
import 'package:capp_mobile/domain/repositories/feedback_repository.dart';
import 'package:dartz/dartz.dart';

import '../remote/dio_network_service.dart';

class FeedbackRepositoryImpl extends FeedbackRepository{

  final DioNetworkService networkService;

  FeedbackRepositoryImpl(this.networkService);

  @override
  Future<List<EventFeedback>> getFeedback(String eventId) async {
    final res = await networkService
        .get("/Feedback/feedback/$eventId");
    if (res is Left) {
      log("Error occurred in getFeedback");
      return [];
    }
    else {
      final data = ((res as Right).value as Response).data;
      if (data is List) {
        return data.map((e) => EventFeedback.fromJson(e)).toList();
      }
      else {
        return [];
      }
    }
  }

  @override
  Future<EventFeedback?> addFeedback(Map<String, dynamic> data) async {
    final res = await networkService.post("/Feedback",
        data: data
    );

    if (res is Left) {
      log("Error occurred in addFeedback");
      return null;
    }
    else {
      final data = ((res as Right).value as Response).data;
      return EventFeedback.fromJson(data);
    }
  }
}