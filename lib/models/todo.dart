class TodoModel {
  final String title;
  final String description;
  final String id;

  TodoModel({required this.title, required this.description, required this.id});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      title: json["title"],
      description: json["description"],
      id: json["_id"],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["title"] = title;
    data["description"] = description;
     data["_id"] = description;
    return data;
  }
}
