
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marc/feature/screen/tabs/gratitudes_screen/data/gratitude_model.dart';
import 'package:marc/feature/screen/tabs/home/home_screen.dart';
import 'package:marc/feature/screen/tabs/proposal_screen/proposal_tab.dart';
import 'package:marc/utils/custom_color.dart';
import 'package:marc/utils/event_param.dart';
import 'package:marc/utils/singleton.dart';
import 'package:provider/provider.dart';
import 'affilate_screen/affiliate_tab_screen.dart';
import 'affilate_screen/bloc/affiliate_bloc.dart';
import 'affilate_screen/data/connection_list.dart';
import 'gratitudes_screen/gratitudes_tab.dart';
import 'mlouge_screen/mLogue_tab.dart';
import 'nav_bar/nav_bar.dart';
import '../../widget/my_widget.dart';

class TabBarScreen extends StatefulWidget {
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  bool selected = true;
  int _selectedIndex = 0;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey globalTabKey = new GlobalKey(debugLabel: 'btm_app_bar');
  late AffiliateBloc bloc;
  final screen = [
    HomeScreen(),
    AffiliateTabScreen(),
    ProposalTabScreen(),
    MlogueTabScreen(),
    GratitudeTabScreen()
  ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timestamp) {
      // do stuff after frame is build
      getMyConnection();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavDrawer(),
      body: screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        key: globalTabKey,
        unselectedItemColor: Colors.grey[400],
        type: BottomNavigationBarType.shifting,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        selectedLabelStyle: GoogleFonts.ubuntu(
            color: Colors.grey[400]),
        unselectedLabelStyle: GoogleFonts.ubuntu(
            color: Colors.grey[400]),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range_outlined),
            label: 'Affiliations',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Proposals',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_outlined),
            label: 'M-Log',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_outlined),
            label: 'Gratitude',

          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: MyColors.darkRed,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  void didChangeDependencies() {
    bloc = Provider.of<AffiliateBloc>(context);
    super.didChangeDependencies();
  }

  getMyConnection() async{

    ConnectionResponse _connectionResponse = await bloc.getConnectionList();
    if (_connectionResponse.data!=null) {
      MySingleton().myConnectionList = _connectionResponse.data!;
    } else {

    }

    EventBusUtils.getInstance().on<EventTabParam>().listen((event) {
      print("-------------->>>>> $event");

        setState(() {
          _selectedIndex = 2;
        });


    });

  }
}