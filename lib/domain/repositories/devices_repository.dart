import '../model/ui_dto/device.dart';

abstract class DevicesRepository {
  Future<List<Device>> getDevices();
}