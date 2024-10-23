import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:f11_flutter/core/response.dart';
import 'package:f11_flutter/domain/model/ui_dto/device.dart';
import 'package:f11_flutter/domain/repositories/devices_repository.dart';

import '../remote/dio_network_service.dart';

class DevicesRepositoryImpl extends DevicesRepository{

  final DioNetworkService networkService;

  DevicesRepositoryImpl(this.networkService);

  @override
  Future<List<Device>> getDevices() async {
    final res = await networkService.get(
        "https://jsonplaceholder.typicode.com/photos");
    if (res is Left) {
      log("Error occurred");
      return [];
    }
    else {
      final data = ((res as Right).value as Response).data;
      if (data is List) {
        return data.map((e) => Device.fromMap(e)).toList();
      }
      else {
        return [];
      }
    }
  }
}