import 'package:capp_mobile/domain/model/ui_dto/project.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var projectProvider = StateNotifierProvider.autoDispose<ProjectNotifier, List<Project>>
  ((ref) => ProjectNotifier());

class ProjectNotifier extends StateNotifier<List<Project>> {
  ProjectNotifier(): super([]);

  void addProject(Project project) {
    state.add(project);
  }

  void removeProject(int projectId) {
    state.removeWhere((element) => element.projectId == projectId);
    state = List.from(state);
  }

  void replaceAllProject(List<Project> newProjects) {
    state = newProjects;
  }
}