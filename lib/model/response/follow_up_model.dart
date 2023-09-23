class FollowUpModel {
  FollowUpModel({
      this.message, 
      this.data, 
      this.isSucsseded, 
      this.status,});

  FollowUpModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    isSucsseded = json['isSucsseded'];
    status = json['status'];
  }
  String? message;
  List<Data>? data;
  bool? isSucsseded;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['isSucsseded'] = isSucsseded;
    map['status'] = status;
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.attachment, 
      this.attachmentPath, 
      this.note, 
      this.creationDate,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    attachment = json['attachment'];
    attachmentPath = json['attachmentPath'];
    note = json['note'];
    creationDate = json['creationDate'];
  }
  int? id;
  dynamic attachment;
  String? attachmentPath;
  String? note;
  String? creationDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['attachment'] = attachment;
    map['attachmentPath'] = attachmentPath;
    map['note'] = note;
    map['creationDate'] = creationDate;
    return map;
  }

}