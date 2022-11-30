import 'dart:convert';

import 'package:ecommerce_user/controller/Constant.dart';
import 'package:ecommerce_user/main.dart';
import 'package:ecommerce_user/model/Users.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  User user = Get.find<User>();
  // ignore: non_constant_identifier_names
  bool _showPassword = true;
  bool _showConfirmPassword = true;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  String? firstName,
      lastName,
      phoneNumberOrEmail,
      password,
      confirmPassword,
      day = "1",
      month = "Jan",
      year = "1980";
  DateTime now = DateTime.now();
  bool? gender = true;
  Future<void> Signup() async {
    if (formState.currentState!.validate()) {
      formState.currentState!.save();
      user.setId = "1";
      user.setFirstName = firstName;
      user.setLastName = lastName;
      user.setPhoneOrEmail = phoneNumberOrEmail;
      user.setPassword = password;
      user.setDay = day;
      user.setMonth = month;
      user.setYear = year;
      user.setGender = gender;
      user.setImageProfile = null;
      user.setImageCasingProfile = null;
      user.setStudyInfo = null;
      user.setJoined = now;
      var userJson = user.toJson();

      String jsonObject = jsonEncode(userJson);

      await getStorage.write("User", jsonObject);

      print("First Name : ${user.getFirstName} , Last Name : ${user.getLastName}" +
          ", phone : ${user.getPhoneOrEmail} , password : ${user.getPassword} , Day : ${user.getDay}" +
          ", Month : ${user.getMonth} , Year : ${user.getYear} , gender : ${user.getGender} , Joined : ${user.getJoined}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.blue[800]),
        backgroundColor: Colors.blue[800],
        elevation: 0,
        title: const Center(
          child: Text(
            "Connect App",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.blue[800],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    "New",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    "Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Row(
                    children: [
                      const Text(
                        "if you have an account ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed("/view/login");
                        },
                        child: const Text("Sign In Here",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Form(
            key: formState,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "The Field is Empty!!";
                          } else if (value.length < 3) {
                            return "The Field is very short!!";
                          } else if (value.length > 15) {
                            "The Field is very long";
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          firstName = newValue;
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.badge,
                              color: Colors.blue,
                            ),
                            label: const Text(
                              "first name",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 77, 75, 75),
                                  fontWeight: FontWeight.bold),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.blue)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.blue)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.red)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: const BorderSide(
                                    width: 2, color: Colors.red)))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "The Field is Empty!!";
                        } else if (value.length < 3) {
                          return "The Field is very short!!";
                        } else if (value.length > 15) {
                          "The Field is very long";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        lastName = newValue;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.badge,
                            color: Colors.blue,
                          ),
                          label: const Text(
                            "last name",
                            style: TextStyle(
                                color: Color.fromARGB(255, 77, 75, 75),
                                fontWeight: FontWeight.bold),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.blue)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.red))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "The Field is Empty!!";
                        } else if (value.length < 3) {
                          return "The Field is very short!!";
                        } else if (value.length > 15) {
                          "The Field is very long";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        phoneNumberOrEmail = newValue;
                      },
                      decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.phone,
                            color: Colors.blue,
                          ),
                          label: const Text(
                            "phone number Or Email",
                            style: TextStyle(
                                color: Color.fromARGB(255, 77, 75, 75),
                                fontWeight: FontWeight.bold),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.blue)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.red))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: _showPassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "The Field is Empty!!";
                        } else if (value.length < 5) {
                          return "The Field is very short!!";
                        } else if (value.length > 20) {
                          "The Field is very long";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        password = newValue;
                      },
                      maxLength: 20,
                      keyboardType: TextInputType.text,
                      controller: _pass,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                            icon: _showPassword
                                ? const Icon(
                                    Icons.visibility,
                                    color: Colors.blue,
                                  )
                                : const Icon(Icons.visibility_off,
                                    color: Colors.blue)),
                        label: const Text(
                          "password",
                          style: TextStyle(
                              color: Color.fromARGB(255, 77, 75, 75),
                              fontWeight: FontWeight.bold),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide:
                                const BorderSide(width: 2, color: Colors.blue)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide:
                                const BorderSide(width: 2, color: Colors.blue)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide:
                                const BorderSide(width: 2, color: Colors.red)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide:
                                const BorderSide(width: 2, color: Colors.red)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: _showConfirmPassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "The Field is Empty!!";
                        } else if (value != _pass.text) {
                          return "The Password Field Does not match The Confirm Password!!";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        confirmPassword = newValue;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _showConfirmPassword = !_showConfirmPassword;
                                });
                              },
                              icon: _showConfirmPassword
                                  ? const Icon(
                                      Icons.visibility,
                                      color: Colors.blue,
                                    )
                                  : const Icon(Icons.visibility_off,
                                      color: Colors.blue)),
                          label: const Text(
                            "confirm password",
                            style: TextStyle(
                                color: Color.fromARGB(255, 77, 75, 75),
                                fontWeight: FontWeight.bold),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.blue)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.blue)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.red))),
                    ),
                  ),
                  Text(
                    "Date Birth",
                    style: TextStyle(color: Colors.blue[800], fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2),
                              ),
                            ),
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            value: Constant.days[0],
                            items: Constant.days.map((String item) {
                              return DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 77, 75, 75)),
                                  ));
                            }).toList(),
                            onChanged: ((value) {
                              day = value;
                            })),
                      ),
                      SizedBox(
                        width: 100,
                        child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2),
                                )),
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            value: Constant.months[0],
                            items: Constant.months.map((String item) {
                              return DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 77, 75, 75)),
                                  ));
                            }).toList(),
                            onChanged: ((value) {
                              month = value;
                            })),
                      ),
                      SizedBox(
                        width: 100,
                        child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2),
                                )),
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            value: Constant.years[0],
                            items: Constant.years.map((String item) {
                              return DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 77, 75, 75)),
                                  ));
                            }).toList(),
                            onChanged: ((value) {
                              year = value;
                            })),
                      ),
                    ],
                  ),
                  Text(
                    "Gender",
                    style: TextStyle(color: Colors.blue[800], fontSize: 20),
                  ),
                  Row(
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
                                      "Male",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 77, 75, 75)),
                                    ),
                                    value: "male",
                                    groupValue: controller.dataGender,
                                    onChanged: (value) {
                                      setState(() {
                                        controller.updateGender(value!);
                                        gender = true;
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
                                    "FeMale",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 77, 75, 75)),
                                  ),
                                  value: "female",
                                  groupValue: controller.dataGender,
                                  onChanged: (value) {
                                    setState(() {
                                      controller.updateGender(value!);
                                      gender = false;
                                    });
                                  });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  GetBuilder(
                      init: User(),
                      builder: (controller) {
                        return MaterialButton(
                            shape: Border.all(
                                color: Colors.blue,
                                width: 5,
                                style: BorderStyle.solid,
                                strokeAlign: StrokeAlign.center),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 150),
                            onPressed: (() {
                              Signup();
                              Get.offNamed("/view/fillPhoto");
                            }),
                            color: Colors.blue[800],
                            child: const Text("Create Account",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)));
                      })
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
