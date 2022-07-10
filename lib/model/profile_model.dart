class UpdateProfileModel {
  int? code;
  String? messages;
  Result? result;

  UpdateProfileModel({this.code, this.messages, this.result});

  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    messages = json['messages'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['messages'] = this.messages;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  int? id;
  String? fullname;
  String? email;
  String? password;
  String? noHp;

  Result({this.id, this.fullname, this.email, this.password, this.noHp});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    email = json['email'];
    password = json['password'];
    noHp = json['no_hp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['password'] = this.password;
    data['no_hp'] = this.noHp;
    return data;
  }
}