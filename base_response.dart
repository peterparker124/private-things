import 'network_response.dart';

const String ERROR_CODE = '-1';

class BaseResponse implements ResponseObject {
  String? errorCode;
  String? errorDescription;
  String? statusCode;
  Error? errorModel;

  BaseResponse({
    this.errorCode,
    this.statusCode,
    this.errorDescription,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        errorCode: json["ERROR_CODE"],
        errorDescription: json["message"],
        statusCode:json["statusCode"],
      );

  @override
  readJson(Map<String, dynamic> json) {
    errorModel = (json["error"]== null? null : Error.fromJson(json["error"])) ?? null;
    errorCode= json["ERROR_CODE"];
    errorDescription=json["message"];
    statusCode = json["statusCode"];

  }

  String? getErrorMessage(){
    return errorDescription;
  }

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode == null ? null : statusCode,
    "ERROR_CODE": errorCode == null ? null : errorCode,
    "message": errorDescription == null ? null : errorDescription,
  };
}

class Error {
Error({
  this.message,
});

String? message;

factory Error.fromJson(Map<String, dynamic> json) => Error(
message: json["message"]==null? null : json["message"],
);

}
