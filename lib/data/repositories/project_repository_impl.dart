import 'package:capp_mobile/data/remote/dio_network_service.dart';
import 'package:capp_mobile/domain/model/ui_dto/project.dart';
import 'package:capp_mobile/domain/repositories/project_repository.dart';
import 'package:capp_mobile/shared/constants/assets.dart';

class ProjectRepositoryImpl extends ProjectRepository{
  final DioNetworkService networkService;

  ProjectRepositoryImpl(this.networkService);

  @override
  Future<List<Project>> getProjects() async {
    return [
      Project(
          projectId: 1,
          projectName: "TEO Customer App",
          projectLogo: icProject),
      Project(
          projectId: 2,
          projectName: "Nordlys",
          projectLogo: icMenu),
      Project(
          projectId: 3,
          projectName: "Tiny Mobile Robots",
          projectLogo: icBell),
      Project(
          projectId: 1,
          projectName: "Dantaxi",
          projectLogo: icProject),
    ];
  }
}