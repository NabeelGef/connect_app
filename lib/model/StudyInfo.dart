// ignore_for_file: public_member_api_docs, sort_constructors_first
class StudyInfo {
  String? primarySchool;
  String? middleSchool;
  String? highSchool;
  String? university;
  String? workPlace;
  String? get getPrimarySchool => this.primarySchool;

  set setPrimarySchool(String? primarySchool) =>
      this.primarySchool = primarySchool;

  get getMiddleSchool => this.middleSchool;

  set setMiddleSchool(middleSchool) => this.middleSchool = middleSchool;

  get getHighSchool => this.highSchool;

  set setHighSchool(highSchool) => this.highSchool = highSchool;

  get getUniversity => this.university;

  set setUniversity(university) => this.university = university;

  get getWorkPlace => this.workPlace;

  set setWorkPlace(workPlace) => this.workPlace = workPlace;

  StudyInfo({
    this.primarySchool,
    this.middleSchool,
    this.highSchool,
    this.university,
    this.workPlace,
  });
  StudyInfo.fromJson(Map<String, dynamic> json) {
    primarySchool = json['primarySchool'];
    middleSchool = json['middleSchool'];
    highSchool = json['highSchool'];
    university = json['university'];
    workPlace = json['workPlace'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['primarySchool'] = this.primarySchool;
    data['middleSchool'] = this.middleSchool;
    data['highSchool'] = this.highSchool;
    data['university'] = this.university;
    data['workPlace'] = this.workPlace;
    return data;
  }
}
