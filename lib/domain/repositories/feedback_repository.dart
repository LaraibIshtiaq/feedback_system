import 'package:capp_mobile/data/remote/models/feedback.dart';

abstract class FeedbackRepository {
  Future<List<EventFeedback>> getFeedback(String eventId);

  Future<EventFeedback?> addFeedback(Map<String, dynamic> data);
}