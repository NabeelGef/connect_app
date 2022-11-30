import 'dart:convert';

import 'package:ecommerce_user/model/Social.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/Constant.dart';
import '../main.dart';
import '../model/Users.dart';

class Region extends StatefulWidget {
  const Region({super.key});

  @override
  State<Region> createState() => _RegionState();
}

class _RegionState extends State<Region> {
  GlobalKey<FormFieldState> dropDownForm = GlobalKey();
  String? city = " ", form = " ";
  User user = Get.find<User>();
  GlobalKey<FormFieldState> formText = GlobalKey();
  var relation = true;
  SaveData() async {
    Social social = Social(relationship: relation);
    formText.currentState!.save();
    dropDownForm.currentState!.save();

    social.setCity = city;
    social.setFrom = form;
    social.setRelationship = relation;
    user.setSocial = social;
    var userJson = user.toJson();

    String jsonObject = jsonEncode(userJson);

    await getStorage.write("User", jsonObject);

    print(
        "city : ${user.getSocial!.getCity} , from : ${user.getSocial!.getFrom} , relation : ${user.getSocial!.getRelationship}");
  }

  var items = ["Syria", "Egypt", "palastine"];
  var _currentSelectedValue = "Syria";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            SaveData();
            Get.toNamed("/view/profile");
          }),
          backgroundColor: Colors.blue[800],
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: Column(children: [
          const Expanded(
              child: Image(image: AssetImage("images/location.png"))),
          Expanded(
            child: SingleChildScrollView(
                child: SizedBox(
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      width: 250,
                      child: DropdownButtonFormField<String>(
                        key: dropDownForm,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 5, color: Colors.blue),
                                borderRadius: BorderRadius.circular(25)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 5, color: Colors.blue),
                                borderRadius: BorderRadius.circular(25)),
                            prefixIcon: const Icon(Icons.location_city)),
                        borderRadius: BorderRadius.circular(25),
                        value: _currentSelectedValue,
                        isDense: true,
                        onChanged: (value) {
                          setState(() {
                            _currentSelectedValue = value!;
                          });
                        },
                        onSaved: (newValue) {
                          city = newValue;
                        },
                        items: items.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 250,
                      child: TextFormField(
                        key: formText,
                        onSaved: (newValue) {
                          form = newValue;
                        },
                        maxLength: 20,
                        decoration: InputDecoration(
                            label: Text("From"),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide:
                                    BorderSide(width: 5, color: Colors.blue)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide:
                                    BorderSide(width: 5, color: Colors.blue))),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 5, color: Colors.blue),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25)),
                            ),
                            child: GetBuilder<Constant>(
                                init: Constant(),
                                builder: (controller) {
                                  return RadioListTile(
                                      title: const Text(
                                        "Single",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 77, 75, 75)),
                                      ),
                                      value: "single",
                                      groupValue: controller.dataRelation,
                                      onChanged: (value) {
                                        setState(() {
                                          controller.updateRelation(value!);
                                          relation = true;
                                        });
                                      });
                                }),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 5, color: Colors.blue),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(25)),
                            ),
                            child: GetBuilder<Constant>(
                              builder: (controller) {
                                return RadioListTile(
                                    title: const Text(
                                      "Married",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 77, 75, 75)),
                                    ),
                                    value: "married",
                                    groupValue: controller.dataRelation,
                                    onChanged: (value) {
                                      setState(() {
                                        controller.updateRelation(value!);
                                        relation = false;
                                      });
                                    });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
          )
        ]));
  }
}
