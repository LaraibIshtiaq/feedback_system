
import 'package:capp_mobile/data/remote/models/feedback.dart';
import 'package:capp_mobile/domain/providers/feedback_repo_provider.dart';
import 'package:capp_mobile/domain/repositories/feedback_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final feedbackViewModelProvider = Provider((ref) {
  final feedbackRepository = ref.watch(feedbackRepositoryProvider);

  return FeedbackViewModel(feedbackRepository: feedbackRepository);
});


class FeedbackViewModel{
  final FeedbackRepository feedbackRepository;

  FeedbackViewModel({
    required this.feedbackRepository,
  });

  TextEditingController eventFeedbackController = TextEditingController(text: "");

  ///Used in Giving Feedbacks of event
  final StateProvider<int> eventStatus = StateProvider<int>((ref) => 1);

  addFeedback(EventFeedback feedback) async {
    dynamic result = await feedbackRepository.addFeedback(
        feedback.toJson(feedback));
  }

  getFeedback(String eventId) async {
    dynamic result = await feedbackRepository.getFeedback(eventId);
  }

  updateFeedbackFields(WidgetRef ref, List<EventFeedback> feedback){
    eventFeedbackController.text = feedback.first.feedbackNote;
    ref.read(eventStatus.notifier).state = feedback.first.rating;
  }

}