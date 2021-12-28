import 'package:marc/feature/screen/tabs/affilate_screen/data/connection_list.dart';

class MySingleton {
  // make this nullable by adding '?'
  static MySingleton? _instance;

  MySingleton._() {
    // initialization and stuff
  }

  factory MySingleton() {
    if (_instance == null) {
      _instance = new MySingleton._();
    }
    // since you are sure you will return non-null value, add '!' operator
    return _instance!;
  }

   List<ConnectionModel> myConnectionList = [];
   int userChamber = -1;

}