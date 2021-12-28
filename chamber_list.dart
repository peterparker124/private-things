import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marc/core/route/my_router.dart';
import 'package:marc/core/route/route_constants.dart';
import 'package:marc/feature/screen/tabs/affilate_screen/bloc/affiliate_bloc.dart';
import 'package:marc/feature/screen/tabs/affilate_screen/data/connection_list.dart';
import 'package:marc/utils/custom_color.dart';
import 'package:marc/utils/custom_text.dart';
import 'package:marc/utils/custom_widget.dart';
import 'package:marc/utils/event_param.dart';
import 'package:marc/utils/my_color.dart';
import 'package:marc/utils/singleton.dart';
import 'package:provider/provider.dart';

class ChamberList extends StatefulWidget {

  final bool isMyChamber;
  const ChamberList( this.isMyChamber, {Key? key}) : super(key: key);

  @override
  _ChamberListState createState() => _ChamberListState();
}

class _ChamberListState extends State<ChamberList> with AutomaticKeepAliveClientMixin<ChamberList>{

  late List<ConnectionModel> mList = [];
  late AffiliateBloc bloc ;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timestamp) {
      // do stuff after frame is build
      getList();
    });

    EventBusUtils.getInstance().on<EventParam>().listen(( EventParam event) {
      print(event.str);

      mList.clear();


      if (widget.isMyChamber) {
        mList = MySingleton().myConnectionList.where((element) => element.fname!.contains(event.str) && element.userChamper == 1).toList();
      } else {
        mList = MySingleton().myConnectionList.where((element) => element.fname!.contains(event.str) && element.userChamper != 1).toList();
      }
       if (event.str.toString().trim().isEmpty) {
         getList();
         return;
       }

      setState(() {
        mList = mList;
      });
    });
  }
  @override
  void didChangeDependencies() {
    bloc = Provider.of<AffiliateBloc>(context);
    super.didChangeDependencies();
  }

  getList() async{

    if(MySingleton().myConnectionList.isNotEmpty) {
      mList.clear();
       if (widget.isMyChamber) {
            mList = MySingleton().myConnectionList.where((element) => element.userChamper == 1).toList();
       } else {
         mList = MySingleton().myConnectionList.where((element) => element.userChamper != 1).toList();
       }
       setState(() {
         mList = mList;
         isLoading = false;
       });
    }else {
      setState(() {
        isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return isLoading? Center(child: CircularProgressIndicator(color: MyColors.darkRed,)): ListView.builder(
        itemCount: mList.length,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _buildRow(index);
        });
  }

  Widget _buildRow(int index) {

    return ListTile(
      onTap: (){
        pushNamed(context, PROFILE_SCREEN, args: mList[index].userid ?? "");
      },
      title: customTextMedium(
          text: mList[index].fname,
          fontSize: 4,
          textColor: MyColors.primaryText),
      subtitle:customTextMedium(
          text: "User - ${mList[index].city}" ,
          fontSize: 3,
          textColor: MyColors.primaryText),
      trailing: Icon(Icons.arrow_forward_outlined ,color: MyColors.darkRed,),
      leading: ConstrainedBox(
      constraints: BoxConstraints(
      minWidth: 44,
      minHeight: 44,
      maxWidth: 44,
      maxHeight: 44,
    ),

    child: Image.asset('assets/images/rectangle-630.png', fit: BoxFit.cover),
    ),
    );
  }

  @override
  bool get wantKeepAlive => false;

}


