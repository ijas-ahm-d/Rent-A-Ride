
class UserSignUpModel {
  String? email;
  String? password;
  String? fullName;
  String? phoneNumber;


  UserSignUpModel({
    this.email,
    this.password,
    this.fullName,
    this.phoneNumber,

  });

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        'email': email,
        "phoneNumber": phoneNumber,
        'password': password,
      };
}
