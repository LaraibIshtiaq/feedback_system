import 'package:f11_flutter/domain/model/ui_dto/device.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var devicesProvider = StateNotifierProvider
    .autoDispose<DevicesNotifier, List<Device>>
  ((ref) => DevicesNotifier());

class DevicesNotifier extends StateNotifier<List<Device>> {
  DevicesNotifier(): super([]);

  void add(Device device) {
    state.add(device);
  }

  void remove(int deviceId) {
    state.removeWhere((element) => element.id == deviceId,);
    state = List.from(state);
  }

  void replaceAll(List<Device> devices) {
    state = devices;
  }
}