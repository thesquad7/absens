class RoleCart {
  String name, id;

  RoleCart({
    required this.name,
    required this.id,
  });

  factory RoleCart.fromJson(Map<String, dynamic> json) {
    return RoleCart(id: json['id'], name: json['name']);
  }
  Map<String, dynamic> toJson() => {"id": id, "name": name};
}
