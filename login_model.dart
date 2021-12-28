


import 'package:marc/core/networking/base_response.dart';

class LoginModel extends BaseResponse {
  LoginModel({

    this.timestamp,
    this.status,
    this.error,
    this.message,
    this.path,
  });

  String? username;
  String? marcTokan;
  dynamic role;
  String? actsno;

  String? timestamp;
  int? status;
  String? error;
  String? message;
  String? path;



  @override
  readJson(Map<String, dynamic> json) {
    super.readJson(json);
    timestamp= json["timestamp"] == null ? null : json["timestamp"];
    status= json["status"] == null ? null : json["status"];
    error=json["error"] == null ? null : json["error"];
    message= json["message"] == null ? null : json["message"];
    path= json["path"] == null ? null : json["path"];
    username= json["username"] == null ? null : json["username"];
    marcTokan= json["marcTokan"] == null ? null : json["marcTokan"];
    role= json["role"];
    actsno= json["actsno"] == null ? null : json["actsno"];
  }

}




class KeyModel {
  KeyModel({
    required this.status,
    this.warning,
    required this.data,
    this.errors,
  });

  bool status;
  dynamic warning;
  String data;
  dynamic errors;

  factory KeyModel.fromJson(Map<String, dynamic> json) => KeyModel(
    status: json["status"] == null ? null : json["status"],
    warning: json["warning"],
    data: json["data"] == null ? null : json["data"],
    errors: json["errors"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "warning": warning,
    "data": data == null ? null : data,
    "errors": errors,
  };
}
