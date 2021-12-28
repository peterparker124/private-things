import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marc/feature/screen/tabs/affilate_screen/data/search_connection.dart';
import 'package:marc/utils/custom_color.dart';
import 'package:marc/utils/custom_text.dart';
import 'package:marc/utils/custom_widget.dart';
import 'package:marc/utils/event_param.dart';

class UserList extends StatefulWidget {
  SearchConnection model;
  UserList(this.model, {Key? key}) : super(key: key);
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late List<User> mUserList;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timestamp) {
      // do stuff after frame is build
      getList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search List"),
      ),
      body: isLoading? Center(child: CircularProgressIndicator(color: MyColors.darkRed,)): ListView.separated(
        itemCount: mUserList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: (){
              var name = "${mUserList[index].fname} , ${mUserList[index].lname}";
              EventBusUtils.getInstance().fire(EventTabParam( 2 , searchUserName: name, searchUserId: mUserList[index].userid));
              Navigator.of(context).pop();
            },
            trailing: Icon(Icons.arrow_forward_outlined, color: MyColors.darkRed,),
            title: customTextMedium(text: "${mUserList[index].fname} , ${mUserList[index].lname}", fontSize: 4, textColor: MyColors.primaryText),
            subtitle:  customTextMedium(text: "${mUserList[index].userChamper} ,  ${mUserList[index].city}", fontSize: 4, textColor: MyColors.primaryText),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }

  void getList() {
    if (widget.model.data!.user!.isNotEmpty) {
       mUserList = widget.model.data!.user!;
    }
    setState(() {
      isLoading = false;
      mUserList = mUserList;
    });
  }
}
