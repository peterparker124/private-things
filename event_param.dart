
import 'package:event_bus/event_bus.dart';
import 'package:marc/feature/screen/tabs/affilate_screen/data/search_connection.dart';

class EventBusUtils {
  static EventBus? _instance;
  static EventBus getInstance () {
    if (_instance == null) {
      _instance = new EventBus();
    }
    // since you are sure you will return non-null value, add '!' operator
    return _instance!;
  }

}

class EventParam{
  String str;
  EventParam(this.str);
}

class EventTabParam{
  int index;
  String? searchUserId;
  String? searchUserName;
  EventTabParam(this.index, {this.searchUserId,  this.searchUserName});
}

