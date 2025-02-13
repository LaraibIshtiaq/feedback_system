class EventFeedback{
  String? eventId;
  String feedbackNote;
  String reviewedBy;
  int rating;

  EventFeedback({
    this.eventId,
    required this.feedbackNote,
    required this.reviewedBy,
    required this.rating
  });

  factory EventFeedback.fromJson(Map<String, dynamic> json) {
    return EventFeedback(
      eventId: json['eventId']??"",
      feedbackNote: json['comment']??"",
      reviewedBy: json['createdName']??"",
      rating: json['rating']??"",
    );
  }


  Map<String, dynamic> toJson(EventFeedback feedback) {
    Map<String, dynamic> data = <String, dynamic>{};
    data['eventId'] = feedback.eventId;
    data['comment'] = feedback.feedbackNote;
    data['createdName'] = feedback.reviewedBy;
    data['rating'] = feedback.rating;
    return data;
  }
}