import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:marc/feature/screen/login/data/login_api_provider.dart';
import 'package:marc/utils/constants.dart';
import 'package:marc/utils/network_util.dart';
import 'package:marc/utils/shared_pref_util.dart';
import 'base_response.dart'as br;
import 'base_response.dart';

Future<Map<String, dynamic>> performNetworkOperation(String api, String reqJson, API_TYPE apiType, {Map<String, String>? header}) async {
  try {
    Map<String, String> headerMap = await getHeader(api);
    // in case you want to send some additional value in header
    if (null != header) {
      headerMap.addAll(header);
    }

    Map<String, dynamic> data = await getData(api, reqJson, apiType, headerMap: headerMap);
    // if (data["STATUS_CODE"] != ERROR_CODE) {
    //   data.addAll(addSuccess());
    // }

    // var response = br.BaseResponse();
    //  response.readJson(data);

    // if (response.statusCode == ERROR_CODE) {
    //   return getBaseErrorResponse(response.error);
    // }

    return data;
  } catch (ex) {
    return getBaseErrorResponse(ex.toString());
  }
}

Future<Map<String, dynamic>> getData(String api, String reqJson, API_TYPE apiType, {Map<String, String>? headerMap}) async {
  String urlTemp = api.startsWith("http") ? api : Constants.ENV + api;
     Uri url = Uri.parse(urlTemp);
  try {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {

      var decodedResponse;
      Client client = Client();

      Response response;
      Duration timeoutDuration = Duration(seconds: 50);
      Function()? onTimeOut = () {
        throw Exception(Constants.TIMEOUT_ERROR_CODE);
      };
      printLogs(url: urlTemp, header: headerMap!, reqJson: reqJson, response: "{\"logId\":\"request\"}");
      if (apiType == API_TYPE.GET) {
        response = await client.get(url, headers: headerMap).timeout(timeoutDuration);
      } else if (apiType == API_TYPE.POST) {
        response = await client.post(url, headers: headerMap, body: reqJson).timeout(timeoutDuration);
      } else if (apiType == API_TYPE.PUT) {
        response = await client.put(url, headers: headerMap, body: reqJson).timeout(timeoutDuration);
      }else if (apiType == API_TYPE.PATCH) {
        response = await client.patch(url, headers: headerMap, body: reqJson).timeout(timeoutDuration);
      } else if (apiType == API_TYPE.FORM) {

        MultipartRequest request = http.MultipartRequest('POST', url);
        Map<String, dynamic> jsonParam = jsonDecode(reqJson);
        jsonParam.forEach((k, v) => request.fields[k] = v);
        request.headers.addAll(headerMap!);
        var responseTemp = await request.send();
        response = await http.Response.fromStream(responseTemp);

      }
      else {
        response = await client.delete(url, headers: headerMap).timeout(timeoutDuration);
      }
      debugPrint("-----status reqJson ---"+reqJson.toString());
      debugPrint("-----status code ---"+response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201  || response.statusCode == 204){

      } else if (response.statusCode == 400 ) {
        throw Exception(Constants.WRONG_PASSWORD);
      } else if (response.statusCode == 401){
        throw Exception(Constants.INVALID_SESSION);
      } else {
        throw Exception(Constants.GENERIC_ERROR_CODE);
      }
//      if (response.statusCode != 200 || response.statusCode != 201) {
//
//      }

      decodedResponse = utf8.decode(response.bodyBytes);
      printLogs(url: urlTemp, header: headerMap!, reqJson: reqJson, response: decodedResponse);
       if(decodedResponse.isEmpty){
         decodedResponse = "{\"logId\":\"update\"}";
       }
      return json.decode(decodedResponse);
    } else {
      throw Exception(Constants.NO_INTERNET_ERROR_CODE);
    }
  } catch (ex) {
    // In case of exception, sending GENERIC_ERROR_CODE as BaseResponse
    return getBaseErrorResponse(ex.toString());
  }
}

Future<Map<String, dynamic>> getBaseErrorResponse(String errorCode) async {
  String errorMessage = await getErrorMessage(errorCode);
  var errorResponse = br.BaseResponse(statusCode: "ERROR_CODE", errorCode: errorCode, errorDescription: errorMessage);
  return errorResponse.toJson();
}

Future<Map<String, String>> getHeader(String api) async {
  Map<String, String> header = Map();
  if (api == LoginApiProvider.LOGIN_API) {
   // header["Content-Type"] = "application/x-www-form-urlencoded";
    header["Content-Type"] = "application/json";
  } else{
    String? token = await SharedPrefSingleton().getAccessToken();
    if (token!=null){
      // header["Authorization"] = 'Bearer ' + token ;
      header["Authorization"] = token ;
    }
    header["Content-Type"] = "application/json";
  }
  return header;
}


enum API_TYPE { GET, POST, DELETE, PUT, PATCH, FORM }