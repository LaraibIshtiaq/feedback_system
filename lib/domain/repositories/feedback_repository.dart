import 'package:capp_mobile/domain/model/ui_dto/feedback.dart';

abstract class FeedbackRepository {
  Future<List<EventFeedback>> getFeedback(String eventId);

  Future<EventFeedback?> addFeedback(Map<String, dynamic> data);
}