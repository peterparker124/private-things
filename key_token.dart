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
