import 'package:f11_flutter/data/repositories/devices_repository_impl.dart';
import 'package:f11_flutter/domain/providers/dio_network_service_provider.dart';
import 'package:f11_flutter/domain/repositories/devices_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/remote/dio_network_service.dart';

Provider<DevicesRepository> devicesRepositoryProvider =
    Provider<DevicesRepository>((ref) {
    final DioNetworkService networkService = ref.watch(netwokServiceProvider);
    return DevicesRepositoryImpl(networkService);
  },
);
