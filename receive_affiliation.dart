import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marc/feature/screen/tabs/affilate_screen/bloc/affiliate_bloc.dart';
import 'package:marc/feature/screen/tabs/affilate_screen/data/sent_connection.dart';
import 'package:marc/feature/widget/my_widget.dart';
import 'package:marc/utils/constants.dart';
import 'package:marc/utils/custom_color.dart';
import 'package:marc/utils/custom_widget.dart';
import 'package:provider/provider.dart';

class ReceiveAffiliationScreen extends StatefulWidget {
  const ReceiveAffiliationScreen({Key? key}) : super(key: key);

  @override
  _ReceiveAffiliationScreenState createState() => _ReceiveAffiliationScreenState();
}

class _ReceiveAffiliationScreenState extends State<ReceiveAffiliationScreen> {
  late List<SentModel> mList = [];
  late AffiliateBloc bloc ;
  bool isLoading = true;
  String loadingText = Constants.PleaseWait;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timestamp) {
      // do stuff after frame is build
      getSentAction();
    });
  }
  @override
  void didChangeDependencies() {
    bloc = Provider.of<AffiliateBloc>(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return isLoading ? noTextFound(showNotFound: isLoading, text: loadingText): ListView.builder(
        itemCount: mList.length,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _buildRow(index);
        });
  }

  Widget _buildRow(int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      customTextBold(
                          text: "To ",
                          fontSize: 3,
                          textColor: MyColors.darkRed),
                      customTextRegular(
                          text: mList[index].toUserid ?? "",
                          fontSize: 4,
                          textColor: MyColors.primaryText),
                      SizedBox(height: 10,),
                      customTextBold(
                          text: "Description ",
                          fontSize: 3,
                          textColor: MyColors.darkRed),
                      customTextRegular(
                          text: mList[index].message,
                          fontSize: 4,
                          textColor: MyColors.primaryText)
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      customTextBold(
                          text: "Date ",
                          fontSize: 3,
                          textColor: MyColors.darkRed),
                      customTextRegular(
                          text: mList[index].createdDate ?? "",
                          fontSize: 4,
                          textColor: MyColors.primaryText),
                      SizedBox(height: 10,),
                      customTextBold(
                          text: "Action ",
                          fontSize: 3,
                          textColor: MyColors.darkRed),
                      customTextBold(
                          text: getStatus(mList[index].status ?? ""),
                          fontSize: 3,
                          textColor: getColorStatus(mList[index].status ?? "")),
                      SizedBox(height: 10,),
                         Visibility(
                           visible: getButtonVisible(mList[index].status ?? ""),
                           child: Row(
                             mainAxisSize: MainAxisSize.min,
                             children: [
                               IconButton(onPressed: (){
                                 actionUpdate(mList[index] ,"R");
                               }, icon: Icon(Icons.cancel_outlined ,color: Colors.red,)),

                               IconButton(onPressed: (){
                                 actionUpdate(mList[index] ,"A");
                               }, icon: Icon(Icons.check_circle_outlined, color: Colors.green,))
                             ],
                           ),
                         ),

                    ],
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }

  void actionUpdate(SentModel model , String Status) {

  }
  getSentAction() async{
    SentConnection resp = await bloc.getReceiveConnectionList();
    if (resp.data!=null) {
      mList.clear();
      if (resp.data!.isNotEmpty) {
        setState(() {
          loadingText = "Not found data";
          isLoading = false;
        });
      }
      setState(() {
        mList = resp.data!;
        isLoading = false;
      });
    } else {
      setState(() {
        loadingText = Constants.PleaseWait;
        isLoading = false;
      });
    }
  }
}


