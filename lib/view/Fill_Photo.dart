import 'dart:convert';
import 'dart:io' as Io;

import 'package:ecommerce_user/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../model/Users.dart';

class FillPhoto extends StatefulWidget {
  const FillPhoto({super.key});

  @override
  State<FillPhoto> createState() => _FillPhotoState();
}

class _FillPhotoState extends State<FillPhoto> {
  // File? imageCamera;
  // File? imageGallery;
  User user = Get.find<User>();
  Future<Io.File?> pickImage(bool type) async {
    try {
      if (type) {
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return null;
        final imageTemp = Io.File(image.path);

        return imageTemp;
      } else {
        final image = await ImagePicker().pickImage(source: ImageSource.camera);
        if (image == null) return null;
        final imageTemp = Io.File(image.path);
        return imageTemp;
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  _showBottomSheet(context, bool type) async {
    // print(
    //     "FirstName : ${user.firstName} , LastName : ${user.lastName} , ImageProfile : ${user.ImageProfile} , ImageCasing  : ${user.ImageCasingProfile}");
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 200,
          width: double.infinity,
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  margin: const EdgeInsets.only(right: 200),
                  child: const Text(
                    "Choose Image",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ]),
              Center(
                heightFactor: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        IconButton(
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.blue,
                              size: 40,
                            ),
                            onPressed: () async {
                              final image = await pickImage(false);
                              final bytes = image!.readAsBytesSync();
                              String img = base64Encode(bytes);
                              if (type) {
                                user.setImageProfile = img;
                                user.setPathProfile = image.path;
                              } else {
                                user.setImageCasingProfile = img;
                                user.setPathCasingProfile = image.path;
                              }
                            }),
                        const Text(
                          "From Camera",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: [
                        IconButton(
                            icon: const Icon(
                              Icons.photo_library,
                              size: 40,
                              color: Colors.blue,
                            ),
                            onPressed: () async {
                              final image = await pickImage(true);
                              final bytes = image!.readAsBytesSync();
                              String img = base64Encode(bytes);

                              if (type) {
                                user.setPathProfile = image.path;
                                user.setImageProfile = img;
                              } else {
                                user.setPathCasingProfile = image.path;
                                user.setImageCasingProfile = img;
                              }
                              var userJson = user.toJson();

                              String jsonObject = jsonEncode(userJson);

                              await getStorage.write("User", jsonObject);
                            }),
                        const Text(
                          "From Gallery",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Center(
          child: Text(
            "Add Image",
            style: TextStyle(color: Colors.blue),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            width: double.infinity,
            height: 250,
            child: Image(
              image: AssetImage("images/adding_photo.png"),
            ),
          ),
          GetBuilder(
              init: User(),
              builder: (controller) {
                String imageProfile = "", pathImageProfile = " ";
                String imageCasing = " ", pathImageCasing = " ";
                Io.File? decodefile;
                if (controller.getImageProfile != null) {
                  imageProfile = controller.getImageProfile!;
                  if (controller.getPathProfile != null) {
                    pathImageProfile = controller.getPathProfile!;
                    final decode = base64Decode(imageProfile);
                    decodefile = Io.File(pathImageProfile);
                    decodefile.writeAsBytes(decode);
                  }
                }
                Io.File? decodefileCase;
                if (controller.getImageCasingProfile != null) {
                  imageCasing = controller.getImageCasingProfile!;
                  if (controller.getPathCasingProfile != null) {
                    pathImageCasing = controller.getPathCasingProfile!;
                    final decodeCase = base64Decode(imageCasing);
                    decodefileCase = Io.File(pathImageCasing);
                    decodefileCase.writeAsBytes(decodeCase);
                  }
                }

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Stack(alignment: Alignment.bottomCenter, children: [
                      Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(width: 2),
                            color: Colors.white,
                          ),
                          width: 400,
                          height: 200,
                          child: decodefileCase == null
                              ? Image.asset(
                                  "images/casing.png",
                                  fit: BoxFit.fill,
                                )
                              : Image.file(decodefileCase)),
                      Padding(
                        padding: const EdgeInsets.only(left: 350),
                        child: Builder(builder: (context) {
                          return IconButton(
                              onPressed: () {
                                _showBottomSheet(context, false);
                              },
                              icon: const Icon(
                                Icons.camera_enhance,
                                color: Color.fromARGB(255, 27, 105, 168),
                              ));
                        }),
                      )
                    ]),
                    decodefile != null
                        ? CircleAvatar(
                            radius: 75,
                            backgroundImage: FileImage(decodefile),
                            child: Stack(children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Colors.white70,
                                  child: Builder(builder: (context) {
                                    return IconButton(
                                        onPressed: () {
                                          _showBottomSheet(context, true);
                                        },
                                        icon: const Icon(Icons.camera_alt));
                                  }),
                                ),
                              ),
                            ]),
                          )
                        : CircleAvatar(
                            radius: 75,
                            backgroundImage:
                                const AssetImage("images/nabeel.png"),
                            child: Stack(children: [
                              Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Colors.white70,
                                  child: Builder(builder: (context) {
                                    return IconButton(
                                        onPressed: () {
                                          _showBottomSheet(context, true);
                                        },
                                        icon: const Icon(Icons.camera_alt));
                                  }),
                                ),
                              ),
                            ]),
                          )
                  ],
                );
              }),
          Padding(
            padding: const EdgeInsets.all(50),
            child: MaterialButton(
              color: Colors.blue[800],
              onPressed: () {
                Get.toNamed("/view/privacy");
                //NextToOtherPage
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Next",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    size: 30,
                    Icons.navigate_next_outlined,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
