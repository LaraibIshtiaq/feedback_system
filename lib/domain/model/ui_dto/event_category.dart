class EventCategory{
  int categoryId;
  String categoryName;

  EventCategory({
    required this.categoryId,
    required this.categoryName
  });

  ///Method to generate [EventCategory] object from json
  factory EventCategory.fromJson(Map<String, dynamic> json) {
    return EventCategory(
        categoryId: json['id']??"",
        categoryName: json['title']??"",
    );
  }

  ///Method to transform [EventCategory] object to json
  Map<String, dynamic> toJson() {
    return {
      'id': categoryId,
      'title': categoryName,
    };
  }
}