class EMoneyModel {
  int? code;
  String? messages;

  EMoneyModel({this.code, this.messages});

  EMoneyModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    messages = json['messages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['messages'] = this.messages;
    return data;
  }
}

