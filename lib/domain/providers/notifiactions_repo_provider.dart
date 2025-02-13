import 'package:capp_mobile/data/remote/dio_network_service.dart';
import 'package:capp_mobile/data/repositories/notifications_repository_impl.dart';
import 'package:capp_mobile/domain/providers/dio_network_service_provider.dart';
import 'package:capp_mobile/domain/repositories/notifications_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


Provider<NotificationsRepository> notificationsRepositoryProvider =
    Provider<NotificationsRepository>((ref) {
    final DioNetworkService networkService = ref.watch(netwokServiceProvider);
    return NotificationsRepositoryImpl(networkService);
  },
);
