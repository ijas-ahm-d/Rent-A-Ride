class SignUpModel {
  String? fullName;
  String? email;
  String? phoneNumber;
  String? password;
  SignUpModel({
    this.email,
    this.fullName,
    this.password,
    this.phoneNumber,
  });

  SignUpModel.fromJson(Map<String, dynamic> json) {
    fullName = json["fullName"];
    email = json["email"];
    phoneNumber = json["phoneNumber"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["fullName"] = fullName;
    data["email"] = email;
    data["phoneNumber"] = phoneNumber;
    data["password"] = password;
    return data;
  }
}
