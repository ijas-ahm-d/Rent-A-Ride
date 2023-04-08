class DriverLoginModel {
  String? email;
  String? password;
  String? sId;
  String? name;
  String? phoneNumber;
  String? profilePhoto;
  String? token;

  DriverLoginModel(
      {this.email,
      this.password,
      this.sId,
      this.name,
      this.phoneNumber,
      this.token,
      this.profilePhoto});

  DriverLoginModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    sId = json['_id'];
    name = json['name'];
    profilePhoto = json['profilePhoto'];
    phoneNumber = json['phoneNumber'];
    token = json['token'];
  }
   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
