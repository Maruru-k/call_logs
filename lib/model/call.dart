class Call {
  int id;
  String name;
  String phone;

  Call({
    required this.id,
    required this.name,
    required this.phone,
  });

  factory Call.fromJson(Map<String, dynamic> json) {
    return Call(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
    );
  }
}
