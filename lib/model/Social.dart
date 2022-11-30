class Social {
  String? city;
  String? from;
  bool relationship = true;
  Social({
    this.city,
    this.from,
    required this.relationship,
  });
  String? get getFrom => this.from;

  set setFrom(String? from) => this.from = from;

  String? get getCity => this.city;

  set setCity(String? city) => this.city = city;

  get getRelationship => this.relationship;

  set setRelationship(relationship) => this.relationship = relationship;

  Social.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    from = json['from'];
    relationship = json['relationship'] ?? true;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['from'] = this.from;
    data['realtionship'] = relationship;
    return data;
  }
}
