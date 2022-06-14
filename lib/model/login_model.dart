class LoginModel {
  int? code;
  String? messages;
  Result? result;

  LoginModel({this.code, this.messages, this.result});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? email;
  String? token;
  String? noHp;
  String? password;
  int? poin;
  int? pin;

  Result(
      {this.id,
      this.name,
      this.email,
      this.token,
      this.noHp,
      this.password,
      this.poin,
      this.pin});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    token = json['token'];
    noHp = json['no_hp'];
    password = json['password'];
    poin = json['poin'];
    pin = json['pin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['token'] = this.token;
    data['no_hp'] = this.noHp;
    data['password'] = this.password;
    data['poin'] = this.poin;
    data['pin'] = this.pin;
    return data;
  }
}
