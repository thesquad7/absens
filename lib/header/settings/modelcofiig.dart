class Dropdown {
  String name, id;

  Dropdown({
    required this.name,
    required this.id,
  });

  factory Dropdown.fromJson(Map<String, dynamic> json) {
    return Dropdown(id: json['id'], name: json['name']);
  }
  Map<String, dynamic> toJson() => {"id": id, "name": name};
}
