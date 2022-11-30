import 'dart:convert';

import 'package:ecommerce_user/model/StudyInfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';
import '../model/Users.dart';

class Privacy extends StatefulWidget {
  const Privacy({super.key});

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  String? workPlace, primarySchool, middleSchool, highSchool, university;
  GlobalKey<FormState> formstateWork = GlobalKey<FormState>();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  User user = Get.find<User>();
  @override
  Widget build(BuildContext context) {
    AddStudyingInfo() async {
      if (formstate.currentState!.validate() &&
          formstateWork.currentState!.validate()) {
        formstate.currentState!.save();
        formstateWork.currentState!.save();
        StudyInfo studyInfo = StudyInfo(
            primarySchool: primarySchool,
            middleSchool: middleSchool,
            highSchool: highSchool,
            university: university,
            workPlace: workPlace);
        user.setStudyInfo = studyInfo;
        var userJson = user.toJson();

        String jsonObject = jsonEncode(userJson);

        await getStorage.write("User", jsonObject);

        print(
            "firstName : ${user.getFirstName} , primarySchool : ${user.studyInfo!.getPrimarySchool} , ImageProfile : ${user.getImageProfile}");
      }
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 19, 124, 171),
      appBar: AppBar(
          backgroundColor: Colors.blue[800],
          centerTitle: true,
          title: const Text(
            "More Informations",
            style: TextStyle(fontSize: 20, color: Colors.white),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AddStudyingInfo();
          Get.toNamed("/view/location");
          //add studying Info
        },
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: Colors.blue[800],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.red,
              height: 200,
              child: Image.asset(
                "images/teach.png",
              ),
            ),
            const Center(
              child: Text(
                "Studying AND Working",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formstate,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                              maxLength: 15,
                              validator: (value) {
                                if (!value!.isEmpty && value.length < 5) {
                                  return " The length must be greater than 5 letters";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                primarySchool = newValue;
                              },
                              decoration: InputDecoration(
                                hintText: "Add primary School",
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.white,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.white,
                                    )),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.white,
                                    )),
                              )),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: TextFormField(
                                maxLength: 15,
                                validator: (value) {
                                  if (!value!.isEmpty && value.length < 5) {
                                    return " The length must be greater than 5 letters";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  middleSchool = newValue;
                                },
                                decoration: InputDecoration(
                                  hintText: "Add middle School",
                                  hintStyle: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        width: 2,
                                        color: Colors.white,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        width: 2,
                                        color: Colors.white,
                                      )),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        width: 2,
                                        color: Colors.white,
                                      )),
                                )))
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                              maxLength: 15,
                              validator: (value) {
                                if (!value!.isEmpty && value.length < 5) {
                                  return " The length must be greater than 5 letters";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                highSchool = newValue;
                              },
                              decoration: InputDecoration(
                                hintText: "Add highSchool",
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.white,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.white,
                                    )),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.white,
                                    )),
                              )),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: TextFormField(
                                maxLength: 15,
                                validator: (value) {
                                  if (!value!.isEmpty && value.length < 5) {
                                    return " The length must be greater than 5 letters";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) {
                                  university = newValue;
                                },
                                decoration: InputDecoration(
                                  hintText: "Add university",
                                  hintStyle: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        width: 2,
                                        color: Colors.white,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        width: 2,
                                        color: Colors.white,
                                      )),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        width: 2,
                                        color: Colors.white,
                                      )),
                                )))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                          key: formstateWork,
                          child: TextFormField(
                              maxLength: 35,
                              validator: (value) {
                                if (!value!.isEmpty && value.length < 5) {
                                  return " The length must be greater than 5 letters";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                workPlace = newValue;
                              },
                              decoration: InputDecoration(
                                hintText: "Add Work Place",
                                suffixIcon: const Icon(
                                  Icons.work,
                                  color: Color.fromARGB(255, 27, 33, 114),
                                ),
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.white,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      width: 2,
                                      color: Colors.white,
                                    )),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      width: 15,
                                      color: Colors.white,
                                    )),
                              ))),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
