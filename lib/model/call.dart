class Call {
  String type;
  String person;
  int count;
  String additional;
  String date;
  bool unmissed;

  Call({
    required this.type,
    required this.person,
    required this.count,
    required this.additional,
    required this.date,
    required this.unmissed,
  });

  factory Call.fromJson(Map<String, dynamic> json) {
    return Call(
      type: json["type"],
      person: json["person"],
      count: json["count"],
      additional: json["additional"],
      date: json["date"],
      unmissed: json["unmissed"],
    );
  }
}
