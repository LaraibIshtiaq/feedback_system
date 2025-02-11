import 'package:capp_mobile/data/remote/dio_network_service.dart';
import 'package:capp_mobile/data/repositories/feedback_repository_impl.dart';
import 'package:capp_mobile/domain/providers/dio_network_service_provider.dart';
import 'package:capp_mobile/domain/repositories/feedback_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


Provider<FeedbackRepository> feedbackRepositoryProvider =
    Provider<FeedbackRepository>((ref) {
    final DioNetworkService networkService = ref.watch(netwokServiceProvider);
    return FeedbackRepositoryImpl(networkService);
  },
);
