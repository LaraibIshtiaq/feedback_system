import 'dart:developer';

import 'package:capp_mobile/core/response.dart';
import 'package:capp_mobile/data/remote/models/event.dart';
import 'package:capp_mobile/domain/repositories/event_repository.dart';
import 'package:dartz/dartz.dart';

import '../remote/dio_network_service.dart';

class EventRepositoryImpl extends EventRepository{

  final DioNetworkService networkService;

  EventRepositoryImpl(this.networkService);

  @override
  Future<List<Event>> getEvents(String projectId, int month) async {
    final res = await networkService
        .get("/Event/events/$projectId?month=$month");
    if (res is Left) {
      log("Error occurred in getEvents");
      return [];
    }
    else {
      final data = ((res as Right).value as Response).data;
      if (data is List) {
        return data.map((e) => Event.fromJson(e)).toList();
      }
      else {
        return [];
      }
    }
    return [
      // Event(
      //     eventId: 1,
      //     eventName: "CAPP - First Demo",
      //     startDate: DateTime(2025, 01, 02),
      //     endDate: DateTime(2025, 01, 02),
      //     eventNote: "eventNote",
      //     eventCategory: EventCategory(
      //         categoryId: Categories.releases.intValue,
      //         categoryName: Categories.releases.stringValue,
      //         categoryColor: Categories.releases.colorValue
      //     ),
      //     feedbacks: [
      //       Feedback(feedbackNote: "We are highly impressed with the progress and improvements made in Release 2 of the project. The team has delivered an exceptional update that aligns closely with our expectations and requirements.",
      //           reviewedBy: "Laraib Ishtiaq", rating: 1)
      //     ]
      // ),
      // Event(
      //     eventId: 2,
      //     eventName: "PK New Year",
      //     startDate: DateTime(2025, 01, 03),
      //     endDate: DateTime(2025, 01, 03),
      //     eventNote: "eventNote",
      //     eventCategory: EventCategory(
      //         categoryId: Categories.pk.intValue,
      //         categoryName: Categories.pk.stringValue,
      //         categoryColor: Categories.pk.colorValue
      //     ),
      //     feedbacks: []
      // ),
      // Event(
      //     eventId: 3,
      //     eventName: "Release Future",
      //     startDate: DateTime(2025, 01, 06),
      //     endDate: DateTime(2025, 01, 07),
      //     eventNote: "eventNote",
      //     eventCategory: EventCategory(
      //         categoryId: Categories.releases.intValue,
      //         categoryName: Categories.releases.stringValue,
      //         categoryColor: Categories.releases.colorValue
      //     ),
      //     feedbacks: []
      // ),
      // Event(
      //     eventId: 4,
      //     eventName: "Mango Festival",
      //     startDate: DateTime(2025, 01, 06),
      //     endDate: DateTime(2025, 01, 07),
      //     eventNote: "eventNote",
      //     eventCategory: EventCategory(
      //         categoryId: Categories.pk.intValue,
      //         categoryName: Categories.pk.stringValue,
      //         categoryColor: Categories.pk.colorValue
      //     ),
      //   feedbacks: []
      // ),
      // Event(
      //     eventId: 5,
      //     eventName: "My Leave",
      //     startDate: DateTime(2025, 01, 19),
      //     endDate: DateTime(2025, 01, 19),
      //     eventNote: "eventNote",
      //     eventCategory: EventCategory(
      //         categoryId: Categories.leaves.intValue,
      //         categoryName: Categories.leaves.stringValue,
      //         categoryColor: Categories.leaves.colorValue
      //     ),
      //     feedbacks: []
      // ),
      // Event(
      //     eventId: 6,
      //     eventName: "New Year Festival",
      //     startDate: DateTime(2025, 01, 21),
      //     endDate: DateTime(2025, 01, 21),
      //     eventNote: "eventNote",
      //     eventCategory: EventCategory(
      //         categoryId: Categories.dk.intValue,
      //         categoryName: Categories.dk.stringValue,
      //         categoryColor: Categories.dk.colorValue
      //     ),
      //     feedbacks: []
      // ),
      // Event(
      //     eventId: 7,
      //     eventName: "Other Event",
      //     startDate: DateTime(2025, 01, 24),
      //     endDate: DateTime(2025, 01, 24),
      //     eventNote: "eventNote",
      //     eventCategory: EventCategory(
      //         categoryId: Categories.others.intValue,
      //         categoryName: Categories.others.stringValue,
      //         categoryColor: Categories.others.colorValue
      //     ),
      //     feedbacks: []
      // ),
      // Event(
      //     eventId: 8,
      //     eventName: "Other Event 2",
      //     startDate: DateTime(2025, 01, 31),
      //     endDate: DateTime(2025, 01, 31),
      //     eventNote: "eventNote",
      //     eventCategory: EventCategory(
      //         categoryId: Categories.others.intValue,
      //         categoryName: Categories.others.stringValue,
      //         categoryColor: Categories.others.colorValue
      //     ),
      //     feedbacks: []
      // ),
      // Event(
      //     eventId: 9,
      //     eventName: "New Year Festival 3",
      //     startDate: DateTime(2025, 01, 04),
      //     endDate: DateTime(2025, 01, 04),
      //     eventNote: "eventNote",
      //     eventCategory: EventCategory(
      //         categoryId: Categories.dk.intValue,
      //         categoryName: Categories.dk.stringValue,
      //         categoryColor: Categories.dk.colorValue
      //     ),
      //     feedbacks: []
      // ),
    ];
  }

  @override
  Future<Event?> addEvent(Map<String, dynamic> data) async {
    final res = await networkService.post("/Event",
        data: data
    );
    if (res is Left) {
      log("Error occurred in addEvent");
      return null;
    }
    else {
      final data = ((res as Right).value as Response).data;
      return Event.fromJson(data);
    }
  }

  @override
  Future<int?> deleteEvent(String eventId) async {
    final res = await networkService.delete("/Event/$eventId");
    if (res is Left) {
      log("Error occurred in deleteEvent");
      return null;
    }
    else {
      final data = ((res as Right).value as Response).statusCode;
      return data;
    }
  }

  @override
  Future<Event?> updateEvent(String eventId, Map<String, dynamic> data) async {
    final res = await networkService.put("/Event/$eventId",
        data: data
    );
    if (res is Left) {
      log("Error occurred in updateEvent");
      return null;
    }
    else {
      final data = ((res as Right).value as Response).data;
      return Event.fromJson(data);
    }
  }
}