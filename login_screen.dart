

import 'dart:convert';

import 'dart:ui';


import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart';
import 'package:marc/core/route/my_router.dart';
import 'package:marc/core/route/route_constants.dart';
import 'package:marc/feature/screen/login/bloc/login_bloc.dart';
import 'package:marc/feature/screen/login/data/login_model.dart';
import 'package:marc/feature/screen/tabs/profile/bloc/user_bloc.dart';
import 'package:marc/feature/screen/tabs/profile/data/user_model.dart';
import 'package:marc/utils/SizeConfig.dart';
import 'package:marc/utils/bottom_sheet.dart';
import 'package:marc/utils/constants.dart';
import 'package:marc/utils/crypto_helper.dart';
import 'package:marc/utils/custom_button.dart';
import 'package:marc/utils/custom_color.dart';
import 'package:marc/utils/custom_widget.dart';
import 'package:marc/utils/my_color.dart';
import 'package:marc/utils/network_loader.dart';
import 'package:marc/utils/shared_pref_util.dart';
import 'package:marc/utils/string_extension.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert' show base64, utf8;
import 'package:encrypt/encrypt.dart' as encrypt;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isVisiblePassword = false;

  late LoginBloc loginBloc;
  late UserBloc userBloc;
  //static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  void initState() {
    super.initState();
    //  final pushNotificationService = PushNotificationService(_firebaseMessaging);
    //  pushNotificationService.initialise();
    

  }
  @override
  void didChangeDependencies() {
    loginBloc = Provider.of<LoginBloc>(context);
    userBloc = Provider.of<UserBloc>(context);
    super.didChangeDependencies();
  }

  getkey() async {
    var k = base64Decode("bXVzdGJlMTZieXRlc2tleQ==").toString();
    final str2 = utf8.decode(base64.decode("bXVzdGJlMTZieXRlc2tleQ=="));
    print(str2);
   // ySpEE91tXhk+fDupIFsVgg==
    var encrypted = encryptAESCryptoJS("Marc@2021", str2);

    var t = decryptAESCryptoJS("ySpEE91tXhk+fDupIFsVgg==",str2);
    print(t);

    final key = encrypt.Key.fromUtf8('bXVzdGJlMTZieXRlc2tleQ==');
    final iv = encrypt.IV.fromLength(16);

    final encrypter = Encrypter( AES(key, mode: AESMode.ecb , padding: 'PKCS7'));

    final encrypted1 = encrypter.encrypt("Marc@2021", iv: iv);
    final decrypted = encrypter.decrypt(encrypted1, iv: iv);
    print(encrypted1.base64);
    print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: Column(

                children: [
                  topLogo(),
                  Expanded(child: bodyView()),
                ],
              ),
            ),

          )
      ),
    );
  }

  Widget bodyView() {
    return Container(
      color: ColorResources.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Align(
          alignment: Alignment.topLeft,
          child: customTextMedium(
              text: "User Name",
              fontSize: 4,
              textColor: MyColors.white,
            )),
            SizedBox(
              height: 10,
            ),

            customEmailFiled(
              textEditingController: emailController,
              hint: "Email Address",
            ),
            // emailTextEdit(
            //     textEditingController: loginController.emailController),
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: customTextMedium(
                  text: "Password",
                  fontSize: 4,
                  textColor: MyColors.white,
                )),
            SizedBox(
              height: 10,
            ),
            customPasswordField(
              textEditingController: passwordController,
              isVisible: false,
              hint: 'Password',
              onTap: () =>
              {
              },
            ),

            GestureDetector(
              onTap: () =>
              {
                pushNamed(context, FORGOT_PASSWORD_SCREEN),
              },
              child: Align(
                alignment: Alignment.topRight,
                child: customTextMedium(
                    text: "Forgot Password?",
                    fontSize: 4.0,
                    textColor: MyColors.white),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RaisedGradientButton(
              text: "Login",
              onPressed: () =>
              {
                loginAction(),
              },),
            const SizedBox(
              height: 20,
            ),

            Spacer(),
            Column(
              children: [
                customTextMediumCenter(
                  text: "MARC Connect is an online social media platform for Mark Members only. To participate in MARC Connect, please join a local MARC chapter.",
                  fontSize: 3,
                  textColor: MyColors.white,
                ),
                customTextMediumCenter(
                  text: "LEARN MORE",
                  fontSize: 3,
                  textColor: MyColors.redtext,
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.safeBlockHorizontal * 2.0,
            ),
          ],
        ),
      ),
    );
  }

Widget topLogo() {
    return Container(
      height: MediaQuery.of(context).size.height/3,
      
      child: Stack(
        alignment: Alignment.center,
         children: [
           Container(
             decoration: const BoxDecoration(
               image: DecorationImage(
                 image: AssetImage('assets/images/corporate-business-handshake-partners.png'),
                 fit: BoxFit.cover,
               ),
             ),
             // Everything above will get blurred
             child: BackdropFilter(
               filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
               child: Container(
                 // optional
                 // grey-ish filter to the background
                 color: Colors.white.withOpacity(0.5),
               ),
             ),
           ),
           Image.asset('assets/images/marc-top.png', fit: BoxFit.contain, height: 150,),

           Positioned(
             bottom: 30,
             right: 20,
             left: 20,
             child: customTextMediumCenter(
               text: "This is the secure system and you need to provide login details to access the portal",
               fontSize: 3.5,
               textColor: MyColors.BlackText,
             ),
           ),
         ],
      ),
    );

}
  void loginAction0() async {
    getkey();
  //  pushNamedAndClearStack(context, DASHBOARD_SCREEN);
  }
  void loginAction() async {
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => AccountScreen()));
    // pushNamedAndClearStack(context, ACCOUNT_SCREEN);
   // pushNamedAndClearStack(context, DASHBOARD_SCREEN);
    //getkey();
    // return;
    var userName = emailController.text.trim();
    var password = passwordController.text.trim();


    if (userName.length == 0 || password.length == 0) {
      displayCustomBottomSheet(
        context: context,
        description: "All fields required.",
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
      return;
    }
    userName = "prem@gmail.com";
    password = "ySpEE91tXhk+fDupIFsVgg==";
    FocusScope.of(context).requestFocus(new FocusNode());
    displayLoader(context);
    LoginModel loginResponse;
    loginResponse = await loginBloc.performLogin(userName, password);

    if (loginResponse.marcTokan != null && loginResponse.marcTokan!.isNotEmpty) {
      UserModel model = await userBloc.getUserDetail(userName);
      if (model.data!=null) {
        await SharedPrefSingleton().setUserModelDetail(model);
      }
      Navigator.of(context).pop();
      await SharedPrefSingleton().putUserName(userName);
      pushNamedAndClearStack(context, DASHBOARD_SCREEN);

    } else if(loginResponse.errorCode == Constants.INVALID_SESSION){
      Navigator.of(context).pop();
      displayCustomBottomSheet(
        context: context,
        description: "Please enter valid email and password.",
        negativeButtonText: "Ok",
      );
      return ;
    } else {
      Navigator.of(context).pop();
      displayCustomBottomSheet(
        context: context,
        description: loginResponse.errorDescription ?? "Please enter valid email and password.",
        negativeButtonText: "Ok",
      );
    }
 }
  }
