import 'dart:convert';

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

bool validateEmail(String value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value) || value == null)
    return false;
  else
    return true;
}