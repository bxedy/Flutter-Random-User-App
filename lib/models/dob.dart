class Dob {
  String? date;
  int? age;

  Dob({this.date, this.age});

  Dob.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['age'] = age;
    return data;
  }
}
