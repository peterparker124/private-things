import 'dart:convert';
// import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

Future<String> getErrorMessage(String errorCode) async {
  if (errorCode.contains(Constants.NO_INTERNET_ERROR_CODE)) {
    return 'Connection Error, verify your Internet connection or try again';
  } else if (errorCode.contains(Constants.TIMEOUT_ERROR_CODE)) {
    return 'Unable to fetch data, Please try again';
  } else if (errorCode.contains(Constants.WRONG_PASSWORD)) {
    return 'Your email or password is wrong. Please try again with proper email and password';
  } else if (errorCode.contains(Constants.INVALID_SESSION)) {
    return Constants.INVALID_SESSION_DESCRIPTION;
  }
  // Some other error like 404 etc (Other than 200)
  return 'Sorry, error occurred. Please try again';
}

Map<String, dynamic> addError() {
  return {
    "status" : "1",
    // "ERROR_CODE" : "",
    "message" : "Unable to fetch data, Please try again"
  };
}

Map<String, dynamic> addSuccess() {
  return {
    "status" : "0",
    // "ERROR_CODE" : "",
    "message" : ""
  };
}

void printLogs({required String reqJson, required String url, required String response, required Map<String, String> header}) async {
  if (!kReleaseMode) {
    String prettyPrint = "";
    prettyPrint = '$prettyPrint\n' + '---------------------------------------------------------';
    prettyPrint = '$prettyPrint\n' + 'Time -> ${getCurrentTimeToPrint()}';
    prettyPrint = '$prettyPrint\n' + 'Request for API -> $url';
    prettyPrint = '$prettyPrint\n' + 'Method Type -> POST';
    prettyPrint = '$prettyPrint\n' + 'Header \n ${json.encode(header).prettyPrint}';
  // prettyPrint = '$prettyPrint\n' + reqJson.prettyPrint;
    prettyPrint = '$prettyPrint\n' + 'Response for API -> $url';
    prettyPrint = '$prettyPrint\n' + response.prettyPrint;
    prettyPrint = '$prettyPrint\n' + '---------------------------------------------------------';

    debugPrint(prettyPrint);
  }
}

String getCurrentTimeToPrint() {
  return DateTime.now().toIso8601String();
}

extension Mine on String {
  String get prettyPrint {
    if (this == null || this.isEmpty) {
      return "";
    } else {
      JsonEncoder encoder = new JsonEncoder.withIndent('  ');
      return encoder.convert(json.decode(this));
    }
  }
}