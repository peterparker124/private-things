import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marc/feature/screen/tabs/affilate_screen/bloc/affiliate_bloc.dart';
import 'package:marc/feature/screen/tabs/affilate_screen/data/connection_list.dart';
import 'package:marc/utils/custom_color.dart';
import 'package:marc/utils/custom_widget.dart';
import 'package:marc/utils/event_param.dart';
import 'package:marc/utils/network_loader.dart';
import 'package:provider/provider.dart';

import 'chamber_list.dart';

class AddAffiliationScreen extends StatefulWidget {
  const AddAffiliationScreen({Key? key}) : super(key: key);

  @override
  _AddAffiliationScreenState createState() => _AddAffiliationScreenState();
}

class _AddAffiliationScreenState extends State<AddAffiliationScreen> {
  int _selectedIndex = 0;
  late AffiliateBloc bloc;
  late ConnectionResponse? _connectionResponse = ConnectionResponse();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timestamp) {
      // do stuff after frame is build
     // getMyConnection();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(
      children: [
        addSearchBar(),
        Expanded(child: addTabbar()),
      ],
    ));

  }

  @override
  void didChangeDependencies() {
    bloc = Provider.of<AffiliateBloc>(context);
    super.didChangeDependencies();
  }

  Widget addSearchBar() {

    return  Padding(
      padding: const EdgeInsets.all(20),
      child: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
      ),
        backgroundColor: MyColors.white,
        primary: false,
        title: TextField(
          onChanged: (str){
              EventBusUtils.getInstance().fire(EventParam(str));
          },
            decoration: InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey))),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: MyColors.secondaryText), onPressed: () {},),
        ]));

  }
  
Widget addTabbar() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DefaultTabController(
        length: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: TabBar(
                  labelColor: MyColors.secondaryText,
                  indicatorColor: MyColors.darkRed,
                  onTap: _onItemTapped,
                  tabs: [
                Tab( child: customTextBoldCenter(
              text: "With  Chamber",
              fontSize: 4,
                  textColor: _selectedIndex ==0 ?MyColors.secondaryText : MyColors.secondaryText.withOpacity(0.5))),
                Tab(child: customTextBoldCenter(
                    text: "Across Chamber ",
                    fontSize: 4,
                    textColor: _selectedIndex ==1 ?MyColors.secondaryText : MyColors.secondaryText.withOpacity(0.5))),
              ]),
            ),
            Container(
              height: 2,
              color: MyColors.secondaryBackground,
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                child: TabBarView(children: [
                  ChamberList(true),
                  ChamberList(false),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
}
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}
