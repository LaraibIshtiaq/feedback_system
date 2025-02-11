import 'package:capp_mobile/data/remote/dio_network_service.dart';
import 'package:capp_mobile/data/repositories/project_repository_impl.dart';
import 'package:capp_mobile/domain/providers/dio_network_service_provider.dart';
import 'package:capp_mobile/domain/repositories/project_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Provider<ProjectRepository> projectRepositoryProvider =
Provider<ProjectRepository>((ref) {
  final DioNetworkService networkService = ref.watch(netwokServiceProvider);
  return ProjectRepositoryImpl(networkService);
},
);