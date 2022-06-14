class HistoryModel {
  int? code;
  String? messages;
  List<Result>? result;

  HistoryModel({this.code, this.messages, this.result});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    messages = json['messages'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['messages'] = this.messages;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? id;
  String? transactionId;
  String? keterangan;
  String? tanggal;
  String? status;

  Result(
      {this.id,
      this.transactionId,
      this.keterangan,
      this.tanggal,
      this.status});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionId = json['transaction_id'];
    keterangan = json['keterangan'];
    tanggal = json['tanggal'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['transaction_id'] = this.transactionId;
    data['keterangan'] = this.keterangan;
    data['tanggal'] = this.tanggal;
    data['status'] = this.status;
    return data;
  }
}
