import 'package:f11_flutter/domain/model/ui_dto/device.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var devicesProvider = StateNotifierProvider
    .autoDispose<DevicesNotifier, List<Device>>
  ((ref) => DevicesNotifier());

class DevicesNotifier extends StateNotifier<List<Device>> {
  DevicesNotifier(): super([
    Device(id: 1, name: "Device 1", description: "Description 1"),
    Device(id: 2, name: "Device 2", description: "Description 2"),
    Device(id: 3, name: "Device 3", description: "Description 3"),
  ]);

  void add(Device device) {
    state.add(device);
  }

  void remove(int deviceId) {
    state.removeWhere((element) => element.id == deviceId,);
    state = List.from(state);
  }
}