class Project{
  int projectId;
  String projectName;
  String projectLogo;

  Project({
    required this.projectId,
    required this.projectName,
    required this.projectLogo
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
        projectId: json['id']??"",
        projectName: json['title']??"",
        projectLogo: json['start_date']??"",
    );
  }
}