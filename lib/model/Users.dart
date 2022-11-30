// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:ecommerce_user/model/Social.dart';
import 'package:get/get.dart';

import 'package:ecommerce_user/model/StudyInfo.dart';

class User extends GetxController {
  String? id;
  String? firstName;
  String? lastName;
  String? phoneOrEmail;
  String? password;
  String? day;
  String? month;
  String? year;
  bool? gender;
  DateTime? joined;
  String? ImageProfile;
  String? ImageCasingProfile;
  String? pathProfile;
  String? pathCasingProfile;
  StudyInfo? studyInfo;
  Social? social;
  Social? get getSocial => this.social;

  set setSocial(Social? social) => this.social = social;
  StudyInfo? get getStudyInfo => this.studyInfo;

  DateTime? get getJoined => this.joined;
  set setJoined(DateTime? joined) => this.joined = joined;

  set setStudyInfo(StudyInfo? studyInfo) {
    this.studyInfo = studyInfo;
    update();
  }

  String? get getPathProfile => this.pathProfile;

  set setPathProfile(String? pathProfile) => this.pathProfile = pathProfile;

  get getPathCasingProfile => this.pathCasingProfile;

  set setPathCasingProfile(pathCasingProfile) =>
      this.pathCasingProfile = pathCasingProfile;

  get getId => this.id;

  set setId(id) {
    this.id = id;
    update();
  }

  String? get getImageProfile => this.ImageProfile;

  set setImageProfile(ImageProfile) {
    this.ImageProfile = ImageProfile;
    update();
  }

  get getImageCasingProfile => this.ImageCasingProfile;

  set setImageCasingProfile(ImageCasingProfile) {
    this.ImageCasingProfile = ImageCasingProfile;
    update();
  }

  String? get getFirstName => this.firstName;

  set setFirstName(String? firstName) {
    this.firstName = firstName;
    update();
  }

  get getLastName => this.lastName;

  set setLastName(lastName) {
    this.lastName = lastName;
    update();
  }

  get getPhoneOrEmail => this.phoneOrEmail;

  set setPhoneOrEmail(phoneOrEmail) {
    this.phoneOrEmail = phoneOrEmail;
    update();
  }

  get getPassword => this.password;

  set setPassword(password) {
    this.password = password;
    update();
  }

  get getDay => this.day;

  set setDay(day) {
    this.day = day;
    update();
  }

  get getMonth => this.month;

  set setMonth(month) {
    this.month = month;
    update();
  }

  get getYear => this.year;

  set setYear(year) {
    this.year = year;
    update();
  }

  get getGender => this.gender;

  set setGender(gender) {
    this.gender = gender;
    update();
  }

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.phoneOrEmail,
      this.password,
      this.day,
      this.month,
      this.year,
      this.gender,
      this.ImageProfile,
      this.ImageCasingProfile,
      this.pathProfile,
      this.pathCasingProfile,
      this.studyInfo,
      this.social,
      this.joined});
  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneOrEmail = json['phoneOrEmail'];
    password = json['password'];
    day = json['day'];
    month = json['month'];
    year = json['year'];
    gender = json['gender'];
    ImageProfile = json['ImageProfile'];
    ImageCasingProfile = json['ImageCasingProfile'];
    studyInfo = json['studyInfo'] != null
        ? StudyInfo.fromJson(json['studyInfo'])
        : null;
    social = json['social'] != null ? Social.fromJson(json['social']) : null;
    joined = DateTime.parse(json['joined']);
    pathProfile = json['pathProfile'];
    pathCasingProfile = json['pathCasingProfile'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phoneOrEmail'] = this.phoneOrEmail;
    data['password'] = this.password;
    data['day'] = this.day;
    data['month'] = this.month;
    data['year'] = this.year;
    data['gender'] = this.gender;
    data['joined'] = this.joined!.toIso8601String();
    data['ImageProfile'] = this.ImageProfile;
    data['ImageCasingProfile'] = this.ImageCasingProfile;
    data['pathProfile'] = this.pathProfile;
    data['pathCasingProfile'] = this.pathCasingProfile;

    if (studyInfo != null) {
      data['studyInfo'] = this.studyInfo!.toJson();
      if (social != null) {
        data['social'] = this.social!.toJson();
      }
    }
    return data;
  }
}
