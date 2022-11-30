import 'package:ecommerce_user/controller/LoginController.dart';
import 'package:ecommerce_user/model/DataLogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String EmailOrPhone = "", password = "";
  GlobalKey<FormState> formstate = GlobalKey();
  bool _showPassword = true;
  @override
  Widget build(BuildContext context) {
    LOGIN() {
      if (formstate.currentState!.validate()) {
        formstate.currentState!.save();
        DataLogin data =
            DataLogin(phoneOrEmail: EmailOrPhone, password: password);
        print("Email : ${data.getPhoneOrEmail} , ${data.password}");

        LoginController login = LoginController();

        login.login(data.getPhoneOrEmail, data.getPassword);
      }
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75.0),
        child: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.grey[800]),
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.white),
          backgroundColor: Colors.white,
          elevation: 5,
          shadowColor: Colors.white,
          title: const Text(
            "Log in",
            style: TextStyle(
                color: Color.fromARGB(255, 77, 75, 75),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          color: Colors.blue[800],
          height: 400,
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Expanded(
                child: Center(
                  child: Text(
                    "Connect App",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 3,
              ),
              Expanded(
                flex: 3,
                child: Form(
                    key: formstate,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            onSaved: (newValue) {
                              EmailOrPhone = newValue!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "The Field is Empty";
                              } else if (value.length < 3) {
                                return "The Field is very short";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: "Email Or Phone Number",
                                suffixIcon: const Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide: const BorderSide(
                                        width: 2, color: Colors.white)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide: const BorderSide(
                                        width: 2, color: Colors.red)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide: const BorderSide(
                                        width: 2, color: Colors.white)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide: const BorderSide(
                                        width: 2, color: Colors.red)),
                                hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            onSaved: (newValue) {
                              password = newValue!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "The Field is Empty";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            obscureText: _showPassword,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide: const BorderSide(
                                        width: 2, color: Colors.white)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide: const BorderSide(
                                        width: 2, color: Colors.red)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide: const BorderSide(
                                        width: 2, color: Colors.white)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                    borderSide: const BorderSide(
                                        width: 2, color: Colors.red)),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _showPassword = !_showPassword;
                                      });
                                    },
                                    icon: _showPassword
                                        ? const Icon(
                                            Icons.visibility,
                                            color: Colors.white,
                                          )
                                        : const Icon(Icons.visibility_off,
                                            color: Colors.white)),
                                hintText: "Password",
                                hintStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            "forget Password ? ",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Divider(
                          color: Colors.white,
                          thickness: 3,
                        ),
                        MaterialButton(
                          onPressed: () {
                            LOGIN();
                          },
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          color: Colors.white,
                          shape: Border.all(width: 2, color: Colors.white),
                          child: const Text(
                            "Log in",
                            style: TextStyle(
                                color: Color.fromARGB(255, 77, 75, 75),
                                fontSize: 20),
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
