// ignore_for_file: public_member_api_docs, sort_constructors_first
class DataLogin {
  String? phoneOrEmail;
  String? password;
  DataLogin({
    this.phoneOrEmail,
    this.password,
  });

  get getPhoneOrEmail => this.phoneOrEmail;

  set setPhoneOrEmail(phoneOrEmail) => this.phoneOrEmail = phoneOrEmail;

  get getPassword => this.password;

  set setPassword(password) => this.password = password;
}
