import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_user/main.dart';
import 'package:ecommerce_user/model/Users.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var data = getStorage.read("User");
    dynamic jsonData = jsonDecode(data);
    User latest = User.fromJson(jsonData);
    String imageProfile = " ", pathImageProfile = " ";
    String imageCasing = " ", pathImageCasing = " ";
    File? decodefile;
    if (latest.getImageProfile != null) {
      imageProfile = latest.getImageProfile!;
      if (latest.getPathProfile != null) {
        pathImageProfile = latest.getPathProfile!;
        final decode = base64Decode(imageProfile);
        decodefile = File(pathImageProfile);
        decodefile.writeAsBytes(decode);
      }
    }
    File? decodefileCase;
    if (latest.getImageCasingProfile != null) {
      imageCasing = latest.getImageCasingProfile!;
      if (latest.getPathCasingProfile != null) {
        pathImageCasing = latest.getPathCasingProfile!;
        final decodeCase = base64Decode(imageCasing);
        decodefileCase = File(pathImageCasing);
        decodefileCase.writeAsBytes(decodeCase);
      }
    }

    // if (user == null) {
    //   user = latest;
    //   print(
    //       "THE LATEST DATA USER ======> first school : ${user.getStudyInfo!.getPrimarySchool}");
    // }

    print(
        "THE LATEST DATA ======> FirstName : ${latest.getStudyInfo!.getPrimarySchool}");
    return Scaffold(
      appBar: AppBar(
        shape: const Border(bottom: BorderSide(color: Colors.white, width: 2)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[800],
        actions: const [
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.home,
            size: 30,
          ),
          Spacer(),
          Icon(Icons.smart_display, size: 30),
          Spacer(),
          Icon(Icons.dashboard, size: 30),
          Spacer(),
          Icon(Icons.account_circle, size: 30),
          Spacer(),
          Icon(Icons.menu, size: 30),
          SizedBox(
            width: 10,
          ),
        ],
        elevation: 10,
      ),
      backgroundColor: Colors.blue[800],
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(children: [
            decodefileCase == null
                ? Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 25),
                      height: 200,
                      child: Image.asset(
                        "images/casing.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                : Center(
                    child: Container(
                        margin: const EdgeInsets.only(top: 25),
                        height: 200,
                        child: Image.file(decodefileCase)),
                  ),
            Container(
                alignment: Alignment.bottomRight,
                margin: const EdgeInsets.only(top: 170),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    color: Colors.white,
                    child: IconButton(
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                    ),
                  ),
                )),
            decodefile != null
                ? Container(
                    margin: const EdgeInsets.only(top: 120),
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 65,
                      backgroundImage: FileImage(decodefile),
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(Icons.camera_alt),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.only(top: 120),
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 65,
                      backgroundImage: AssetImage("images/nabeel.png"),
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(Icons.camera_alt),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                  )
          ]),
          Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.center,
            child: Text(
              "${latest.getFirstName} ${latest.getLastName}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Spacer(),
              Container(
                width: Get.width / 3,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.white,
                  onPressed: () {},
                  child: Row(children: [
                    Text(
                      "Add Story",
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const CircleAvatar(
                      radius: 10,
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ]),
                ),
              ),
              Spacer(),
              Container(
                width: Get.width / 3,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.white,
                  onPressed: () {},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Edit profile",
                          style: TextStyle(
                              color: Colors.blue[800],
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const CircleAvatar(
                          radius: 10,
                          child: Center(
                            child: Icon(
                              Icons.edit,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ]),
                ),
              ),
              Spacer(),
              Container(
                  width: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 40.0,
                      width: 50.0,
                      color: Colors.white,
                      child: IconButton(
                        icon: const Icon(
                          Icons.toc,
                          size: 30,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  )),
              Spacer()
            ],
          ),
          const Divider(
            height: 25,
            indent: 25,
            endIndent: 25,
            thickness: 3,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.school,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Studied In ${latest.getStudyInfo!.getPrimarySchool}",
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.house,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Lives In ${latest.getSocial!.getCity}",
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "From ${latest.getSocial!.getFrom}",
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.favorite,
                ),
                const SizedBox(
                  width: 10,
                ),
                latest.getSocial!.getRelationship
                    ? const Text(
                        "Single",
                        style: TextStyle(fontSize: 20),
                      )
                    : const Text(
                        "Married",
                        style: TextStyle(fontSize: 20),
                      )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Row(
              children: [
                const Icon(
                  Icons.schedule,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "Joined ${latest.joined!.month} ${latest.joined!.year}",
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
