import 'package:capp_mobile/domain/model/ui_dto/project.dart';

abstract class ProjectRepository {
  Future<List<Project>> getProjects();
}