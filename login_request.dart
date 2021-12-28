
class LoginRequest {
  LoginRequest({
    required this.username,
    required this.password,
    required this.actInfo,
  });

  String username;
  String password;
  ActInfo actInfo;


  Map<String, dynamic> toJson() => {
    "username": username == null ? null : username,
    "password": password == null ? null : password,
    "actInfo": actInfo == null ? null : actInfo.toJson(),
  };
}

class ActInfo {
  ActInfo({
    required this.marcInfo,
  });

   MarcInfo marcInfo;

  Map<String, dynamic> toJson() => {
    "marc_info": marcInfo == null ? null : marcInfo.toJson(),
  };
}

class MarcInfo {
  MarcInfo({
    required this.userid,
    required this.ipaddr,
    required this.sessionid,
    required this.deviceType,
    required this.deviceInfo,
    required this.deviceId,
    required this.deviceMacaddr,
    required  this.additionalinfo,
    required this.loginMode,
  });

  String userid;
  String ipaddr;
  String sessionid;
  String deviceType;
  String deviceInfo;
  String deviceId;
  String deviceMacaddr;
  String additionalinfo;
  String loginMode;


  Map<String, dynamic> toJson() => {
    "userid": userid == null ? null : userid,
    "ipaddr": ipaddr == null ? null : ipaddr,
    "sessionid": sessionid == null ? null : sessionid,
    "deviceType": deviceType == null ? null : deviceType,
    "deviceInfo": deviceInfo == null ? null : deviceInfo,
    "deviceId": deviceId == null ? null : deviceId,
    "deviceMacaddr": deviceMacaddr == null ? null : deviceMacaddr,
    "additionalinfo": additionalinfo == null ? null : additionalinfo,
    "loginMode": loginMode == null ? null : loginMode,
  };
}
