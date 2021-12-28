import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marc/feature/screen/tabs/affilate_screen/data/connection_list.dart';
import 'package:marc/feature/screen/tabs/affilate_screen/ui/add_affilliation.dart';
import 'package:marc/feature/screen/tabs/affilate_screen/ui/receive_affiliation.dart';
import 'package:marc/feature/screen/tabs/affilate_screen/ui/sent_affiliation.dart';
import 'package:marc/feature/screen/tabs/affilate_screen/ui/serch_affiliation.dart';
import 'package:marc/feature/screen/tabs/home/home_screen.dart';
import 'package:marc/utils/custom_color.dart';
import 'package:marc/utils/custom_widget.dart';
import 'package:marc/utils/dimensions.dart';
import 'package:marc/utils/singleton.dart';
import 'package:provider/provider.dart';

import 'bloc/affiliate_bloc.dart';

class AffiliateTabScreen extends StatefulWidget {
  AffiliateTabScreen({Key? key}) : super(key: key);

  @override
  _AffiliateTabScreenState createState() => _AffiliateTabScreenState();
}

class _AffiliateTabScreenState extends State<AffiliateTabScreen>   with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  List<String> arrTitle = ["Add \n Affiliations","Overall \n Search","Sent \n Affiliations","Received \nAffiliations"];
 TabController? _controller ;
  @override
  void initState() {
    super.initState();
    // _controller = TabController(length: arrTitle.length, vsync: this);
    //
    // _controller!.addListener(() {
    //   setState(() {
    //     _selectedIndex = _controller!.index;
    //   });
    //   print("Selected Index: " + _controller!.index.toString());
    // });
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(150.0), // here the desired height
            child: setPage(),
          ),
          body: TabBarView(
          //  controller: _controller,
            children: <Widget>[
              AddAffiliationScreen(),
              SearchAffiliationScreen(false),
              SentAffiliationScreen(),
              ReceiveAffiliationScreen(),
            ],
          ),
        ),
    );
  }
  Widget setPage() {
    Color red800 = MyColors.secondaryBackground;
    return Stack(
      children: <Widget>[
        Container(     // Background
          child: Row(
            children: [
              IconButton(onPressed: (){
                Scaffold.of(context).openDrawer();
              }, icon:Icon(Icons.menu_outlined, color: MyColors.primaryText)),
              Expanded(
                child: customTextBoldCenter(
                    text: "Affiliation ",
                    fontSize: 4,
                    textColor: MyColors.primaryText),
              )

            ],
          ),
          color: red800,
          height: 140,
          width: MediaQuery.of(context).size.width,
        ),

        Container(),   // Required some widget in between to float AppBar

        Positioned(    // To take AppBar Size only
          top: 110.0,
          left: 10.0,
          right: 10.0,
          child: TabBar(
           // controller: _controller,
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: MyColors.WhiteColor,
            onTap: _onItemTapped,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.transparent,
            tabs: <Widget>[

              Tab(
                child: Container(
                  constraints: BoxConstraints.expand(width: 110),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: _selectedIndex== 0 ?  MyColors.darkRed :MyColors.white,
                      boxShadow: [
                      Shadows.primaryShadow,
                    ],
                      ),
                  alignment: Alignment.center,
                  child: customTextBoldCenter(text: arrTitle[0],
                      fontSize: 3.5,
                      textColor: _selectedIndex== 0 ? MyColors.white : MyColors.redtext),
                ),
              ),
              Tab(
                child: Container(
                  constraints: BoxConstraints.expand(width: 110),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: _selectedIndex== 1 ?  MyColors.darkRed :MyColors.white,
                    boxShadow: [
                      Shadows.primaryShadow,
                    ],
                  ),
                  alignment: Alignment.center,
                  child: customTextBoldCenter(text: arrTitle[1],
                      fontSize: 3.5,
                      textColor: _selectedIndex== 1 ? MyColors.white : MyColors.redtext),),
              ),
              Tab(
                child: Container(
                  constraints: BoxConstraints.expand(width: 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: _selectedIndex== 2 ?  MyColors.darkRed :MyColors.white,
                    boxShadow: [
                      Shadows.primaryShadow,
                    ],
                  ),
                    alignment: Alignment.center,
                    child: customTextBoldCenter(text: arrTitle[2],
                        fontSize: 3.5,
                        textColor: _selectedIndex== 2 ? MyColors.white : MyColors.redtext),),
              ),
              Tab(
                child: Container(
                  constraints: BoxConstraints.expand(width: 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: _selectedIndex== 3 ?  MyColors.darkRed :MyColors.white,
                    boxShadow: [
                      Shadows.primaryShadow,
                    ],
                  ),
                  alignment: Alignment.center,
                  child: customTextBoldCenter(text: arrTitle[3],
                      fontSize: 3.5,
                      textColor: _selectedIndex== 3 ? MyColors.white : MyColors.redtext),),
              ),
            ],
          )
        )

      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

