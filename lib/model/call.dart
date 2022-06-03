class Call {
  String type;
  String person;
  int calls;
  String additional;
  String date;
  bool missed;

  Call({
    required this.type,
    required this.person,
    required this.calls,
    required this.additional,
    required this.date,
    required this.missed,
  });

  factory Call.fromJson(Map<String, dynamic> json) {
    return Call(
      type: json["type"],
      person: json["person"],
      calls: int.parse(json["calls"]),
      additional: json["additional"],
      date: json["date"],
      missed: json["missed"],
    );
  }
}
