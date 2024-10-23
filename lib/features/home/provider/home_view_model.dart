import 'package:f11_flutter/domain/repositories/devices_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/providers/devices_repo_provider.dart';
import 'devices_provider.dart';

final homeViewModel = Provider((ref) {
  final devicesNotifier = ref.read(devicesProvider.notifier);
  final devicesRepository = ref.watch(devicesRepositoryProvider);
  return HomeViewModel(devicesNotifier: devicesNotifier, devicesRepository: devicesRepository);
});


class HomeViewModel{
  final DevicesNotifier devicesNotifier;
  final DevicesRepository devicesRepository;

  HomeViewModel({required this.devicesNotifier, required this.devicesRepository});

  void getDevices() async {
    final devices = await devicesRepository.getDevices();
    devicesNotifier.replaceAll(devices);
  }
}