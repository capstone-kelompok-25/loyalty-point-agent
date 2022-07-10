class CustomerModel {
  int? code;
  String? messages;
  Result? result;

  CustomerModel({this.code, this.messages, this.result});

  CustomerModel.fromJson(Map<String, dynamic> json) {
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
  String? noHp;

  Result({this.id, this.name, this.email, this.noHp});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    noHp = json['no_hp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['no_hp'] = this.noHp;
    return data;
  }
}