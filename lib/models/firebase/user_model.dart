class UserModel {
  String? fullName;
  String? phone;
  String? uid;
  String? email;

  UserModel({this.fullName, this.uid, this.email, this.phone});

  UserModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    fullName = json['fullName'];
    uid = json['uid'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['fullName'] = fullName;
    data['uid'] = uid;
    data['email'] = email;
    return data;
  }
}
