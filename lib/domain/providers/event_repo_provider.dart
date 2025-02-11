import 'package:capp_mobile/data/repositories/event_repository_impl.dart';
import 'package:capp_mobile/domain/providers/dio_network_service_provider.dart';
import 'package:capp_mobile/domain/repositories/event_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/remote/dio_network_service.dart';

Provider<EventRepository> eventRepositoryProvider =
    Provider<EventRepository>((ref) {
    final DioNetworkService networkService = ref.watch(netwokServiceProvider);
    return EventRepositoryImpl(networkService);
  },
);
