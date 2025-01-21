import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:capp_mobile/core/response.dart';
import 'package:capp_mobile/domain/model/ui_dto/event.dart';
import 'package:capp_mobile/domain/repositories/devices_repository.dart';

import '../remote/dio_network_service.dart';

class EventRepositoryImpl extends EventRepository{

  final DioNetworkService networkService;

  EventRepositoryImpl(this.networkService);

  @override
  Future<List<Event>> getEvents() async {
    /*final res = await networkService
        .get("https://jsonplaceholder.typicode.com/photos");
    if (res is Left) {
      log("Error occurred");
      return [];
    }
    else {
      final data = ((res as Right).value as Response).data;
      if (data is List) {
        return data.map((e) => Event.fromJson(e)).toList();
      }
      else {*/
        return [];
     /* }
    }*/
  }
}