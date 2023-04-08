class UserSignUpModel {
  String? email;
  String? password;
  String? sId;
  String? fullName;
  String? phoneNumber;
  String? token;

  UserSignUpModel({
    this.email,
    this.password,
    this.sId,
    this.fullName,
    this.phoneNumber,
    this.token,
  });

  UserSignUpModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    sId = json['_id'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["fullName"] = fullName;
    data['email'] = email;
    data["phoneNumber"] = phoneNumber;
    data['password'] = password;
    return data;
  }
}
