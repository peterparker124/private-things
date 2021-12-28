import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marc/core/route/my_router.dart';
import 'package:marc/core/route/route_constants.dart';
import 'package:marc/feature/screen/tabs/affilate_screen/bloc/affiliate_bloc.dart';
import 'package:marc/feature/screen/tabs/affilate_screen/data/connection_list.dart';
import 'package:marc/feature/screen/tabs/affilate_screen/data/search_connection.dart';
import 'package:marc/feature/screen/tabs/affilate_screen/ui/user_list.dart';
import 'package:marc/feature/screen/tabs/profile/data/user_model.dart';
import 'package:marc/feature/screen/tabs/profile/profile_screen.dart';
import 'package:marc/feature/widget/enum_type.dart';
import 'package:marc/utils/bottom_sheet.dart';
import 'package:marc/utils/custom_button.dart';
import 'package:marc/utils/custom_color.dart';
import 'package:marc/utils/custom_widget.dart';
import 'package:marc/utils/network_loader.dart';
import 'package:marc/utils/shared_pref_util.dart';
import 'package:provider/provider.dart';

class SearchAffiliationScreen extends StatefulWidget {
  final bool isFromSearch;
  const SearchAffiliationScreen(this.isFromSearch, {Key? key}) : super(key: key);

  @override
  _SearchAffiliationScreenState createState() => _SearchAffiliationScreenState();
}

class _SearchAffiliationScreenState extends State<SearchAffiliationScreen> {

  String selectedRegional = "India";
  String selectedZone = "Select";
  String selectedArea= "Select";
  List<String> mDelhiCity = ["Select","Kozhikode","kochi","Bengalore"];
  List<String> mTamilCity = ["Select","Mahabalipuram","Chennai","Kanniyakumari"];
  var keyWordController = TextEditingController();
  var companyController = TextEditingController();
  var nameController = TextEditingController();
  late AffiliateBloc bloc ;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [

            //- --------------1------------------------------
            Align(
                alignment: Alignment.topLeft,
                child: customTextBold(
                  text: "Keywords",
                  fontSize: 4,
                  textColor: MyColors.darkRed,
                )),
            SizedBox(
              height: 10,
            ),

            customEmailFiled(
              textEditingController: keyWordController,
              hint: "",
            ),
            //- --------------1------------------------------
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: customTextBold(
                  text: "Name*",
                  fontSize: 4,
                  textColor: MyColors.darkRed,
                )),
            SizedBox(
              height: 10,
            ),

            customEmailFiled(
              textEditingController: nameController,
              hint: "Name",
            ),
            //- --------------1------------------------------
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: customTextBold(
                  text: "Company",
                  fontSize: 4,
                  textColor: MyColors.darkRed,
                )),
            SizedBox(
              height: 10,
            ),

            customEmailFiled(
              textEditingController: companyController,
              hint: "",
            ),
            //- --------------1------------------------------
            SizedBox(
              height: 20,
            ),
            customDropDown(["Select","India","other"], "Regional",TypeOptions.regional),
            SizedBox(
              height: 20,
            ),

            customDropDown(["Select","TamilNadu","Delhi"], "Zone",TypeOptions.zone),
            SizedBox(
              height: 20,
            ),

            customDropDown(getCity(), "Area",TypeOptions.area),

            SizedBox(
              height: 30,
            ),
            RaisedGradientButton(
              text: "Search",
              onPressed: () =>
              {
                  actionSearch(),
              },),
          ],
        ),
      ),
    ));
  }

  Widget customDropDown(List<String> options, String  title, TypeOptions type) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          customTextBold(
            text: title,
            fontSize: 4,
            textColor: MyColors.darkRed,
          ),
          SizedBox(height: 10,),
          InputDecorator(
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0) , ),
              contentPadding: EdgeInsets.all(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isDense: true,
                isExpanded: true,
                value: getOptionsValue(type),
                hint: Text("Select"),
                items: options
                    .map((value) => DropdownMenuItem(
                  child: Text(value),
                  value: value,
                ))
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    setOptionsValue(type, newValue ?? "" );
                  });

                },
              ),
            ),
          ),
        ]);
  }

  getOptionsValue(TypeOptions type ) {
    switch (type) {
      case TypeOptions.regional:
        return selectedRegional;
      case TypeOptions.zone:
        return selectedZone;
      case TypeOptions.area:
        return selectedArea;
      default:
        return "";
    }
  }
  setOptionsValue(TypeOptions type, String value ) {
    switch (type) {
      case TypeOptions.regional:
        setState(() {
          selectedRegional = value;
        });
        break;
      case TypeOptions.zone:
        setState(() {
          selectedZone = value;
        });
        break;
      case TypeOptions.area:
        setState(() {
          selectedArea = value;
        });
        break;
      default:
        break;
    }
  }

  List<String> getCity() {
    if (selectedZone == "Delhi") {
      return mDelhiCity;
    } else {
      return mTamilCity;
    }
  }
  @override
  void didChangeDependencies() {
    bloc = Provider.of<AffiliateBloc>(context);
    super.didChangeDependencies();
  }

  actionSearch() async{

    var userName = nameController.text.trim();

    if (userName.length == 0 ) {
      displayCustomBottomSheet(
        context: context,
        description: "Enter the Name.",
        negativeButtonText: "Ok",
      );
      return;
    }

    FocusScope.of(context).requestFocus(new FocusNode());
    displayLoader(context);
    UserModel? _userModel = await SharedPrefSingleton().getUserModel();
    RequestMyConnection req = RequestMyConnection(marcName: userName ?? "" , marcChid: "${_userModel!.data!.userDet!.userChamper }" ) ;
    SearchConnection resp = await bloc.getSearchConnectionList(json.encode(req.toSearch()));
    Navigator.of(context).pop();
    if (resp.data!= null && resp.data!.user!.length > 0) {
         pushNamed(context, USER_LIST_SCREEN , args: resp);
         if(widget.isFromSearch){
          // Navigator.of(context).pop();
         }
    } else {
      displayCustomBottomSheet(
        context: context,
        description: "There is no record found.",
        negativeButtonText: "Ok",
      );
    }
  }

}
