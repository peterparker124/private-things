
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:marc/feature/screen/login/bloc/login_bloc.dart';
import 'package:marc/utils/SizeConfig.dart';
import 'package:marc/utils/bottom_sheet.dart';
import 'package:marc/utils/custom_button.dart';
import 'package:marc/utils/custom_color.dart';
import 'package:marc/utils/custom_widget.dart';
import 'package:marc/utils/my_color.dart';
import 'package:marc/utils/network_loader.dart';
import 'package:marc/utils/string_extension.dart';
import 'package:provider/provider.dart';



class ForgotScreen extends StatefulWidget {
  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  late LoginBloc loginBloc;
  @override
  void initState(){
    super.initState();
  }
  @override
  void didChangeDependencies() {
    loginBloc = Provider.of<LoginBloc>(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar:  customAppBar(
            title: "Forgot password",
            onTab: ()=>{
              Navigator.of(context).pop(),
            }
        ),
        backgroundColor: ColorResources.primaryColor,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 150,
                ),
                customTextBold(
                  text: "Password Reset",
                  fontSize: 7,
                  textColor: MyColors.WhiteColor,
                ),
                SizedBox(
                  height: 15,
                ),
                customTextMedium(
                  text: "Enter your email below in order to reset your account.",
                  fontSize: 4,
                  textColor: MyColors.WhiteColor,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 9.0,
                ),
                customEmailFiled(
                  textEditingController: emailController,
                  hint: "Email Address",
                ),
                // emailTextEdit(
                //     textEditingController: loginController.emailController),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 6.0,
                ),
                 RaisedGradientButton(
                     text: "Submit",
                     onPressed: () => {
                      submitAction(),
                     },),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 3.5,
                ),
              ],
            ),
          ),

        )
      ),
    );
  }



  void submitAction() async {

    var userName =  emailController.text.trim();

    if (userName.length ==0 ) {
      displayCustomBottomSheet(
        context: context,
        description: "Enter email address.",
        negativeButtonText: "Ok",
      );
      return;
    }
    if (!validateEmail(userName)) {
      displayCustomBottomSheet(
        context: context,
        description: "Enter valid email address.",
        negativeButtonText: "Ok",
      );
      return ;
    }

    FocusScope.of(context).requestFocus(new FocusNode());
    displayLoader(context);

    String loginResponse = await loginBloc.forgotPassword(userName);
    Navigator.of(context).pop();
    if (loginResponse!= null) {
      displayCustomBottomSheet(
        context: context,
        description: loginResponse,
        negativeButtonText: "Ok",
      );
    }
  }
}