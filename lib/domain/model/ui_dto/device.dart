class Device{
  int id;
  String name;
  String url;

  Device({required this.id, required this.name, required this.url});

  factory Device.fromMap(Map<String, dynamic> json) {
    return Device(
      id: json['id'],
      name: json['title'],
      url: json['url'],
    );
  }

}