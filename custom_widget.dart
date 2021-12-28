import 'dart:ui';


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marc/utils/my_color.dart';

import 'SizeConfig.dart';
import 'custom_color.dart';


TextStyle customTextStyleRegular(
    {required var fontSize, required Color textColor}) {
  return  GoogleFonts.poppins(
      fontSize: SizeConfig.safeBlockHorizontal * fontSize,
      color: textColor,
      height: 1.5,
      fontWeight: FontWeight.w400);
}

TextStyle customTextStyleRegularBold(
    {required var fontSize, required Color textColor}) {
  return TextStyle(
      fontSize: SizeConfig.safeBlockHorizontal * fontSize,
      color: textColor,
      fontFamily: 'Regular',
      fontWeight: FontWeight.bold);
}

TextStyle customTextStyleBold(
    {required var fontSize, required Color textColor}) {
  return GoogleFonts.poppins(
      fontSize: SizeConfig.safeBlockHorizontal * fontSize,
      color: textColor,
      fontWeight: FontWeight.w500);
}

TextStyle customTextStyleSemiBold(
    {required var fontSize, required Color textColor}) {
  return GoogleFonts.poppins(
      fontSize: SizeConfig.safeBlockHorizontal * fontSize,
      color: textColor,
      fontWeight: FontWeight.w200);
}

TextStyle customTextStyleMedium(
    {required var fontSize, required Color textColor}) {
  return GoogleFonts.poppins(
      fontSize: SizeConfig.safeBlockHorizontal * fontSize,
      color: textColor,
      height: 1.5,
      fontWeight: FontWeight.w400);
}

Widget customTextRegular({
  required var text,
  required var fontSize,
  required Color textColor,
}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: customTextStyleRegular(
      fontSize: fontSize,
      textColor: textColor,
    ),
  );
}

Widget customTextRight({
  required var text,
  required var fontSize,
  required Color textColor,
}) {
  return Text(
    text,
    textAlign: TextAlign.right,
    style: customTextStyleRegular(
      fontSize: fontSize,
      textColor: textColor,
    ),
  );
}

Widget customTextRegularCenterBold({
  required var text,
  required var fontSize,
  required Color textColor,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: customTextStyleRegularBold(
      fontSize: fontSize,
      textColor: textColor,
    ),
  );
}

Widget customTextBold({
  required var text,
  required var fontSize,
  required Color textColor,
}) {
  return Text(
    text,
    style: customTextStyleBold(
      fontSize: fontSize,
      textColor: textColor,
    ),
  );
}
Widget customTextMultiBold({
  required var text,
  required var fontSize,
  required Color textColor,
}) {
  return Text(
    text,
    maxLines : 2,
    style: customTextStyleBold(
      fontSize: fontSize,
      textColor: textColor,
    ),
  );
}


Widget customTextBoldCenter({
  required var text,
  required var fontSize,
  required Color textColor,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: customTextStyleBold(
      fontSize: fontSize,
      textColor: textColor,
    ),
  );
}

Widget customTextSemiBold({
  required var text,
  required var fontSize,
  required Color textColor,
}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: customTextStyleSemiBold(
      fontSize: fontSize,
      textColor: textColor,
    ),
  );
}

Widget customTextSemiBoldCenter({
  required var text,
  required var fontSize,
  required Color textColor,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: customTextStyleSemiBold(
      fontSize: fontSize,
      textColor: textColor,
    ),
  );
}

Widget customTextMedium({
  required var text,
  required var fontSize,
  required Color textColor,
}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: customTextStyleMedium(
      fontSize: fontSize,
      textColor: textColor,
    ),
  );
}


Widget customTextBorderClick({
  required var text,
  required var fontSize,
  required Color textColor,
  void Function()? onPressed
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      height: 40,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 0.5),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        color: white,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: customTextStyleMedium(
          fontSize: fontSize,
          textColor: textColor,
        ),
      ),
    ),
  );
}

Widget customTextMediumSingleLine({
  required var text,
  required var fontSize,
  required Color textColor,
}) {
  return Text(
    text,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: customTextStyleMedium(
      fontSize: fontSize,
      textColor: textColor,
    ),
  );
}

Widget customTextMediumCenter({
  required var text,
  required var fontSize,
  required Color textColor,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: customTextStyleMedium(
      fontSize: fontSize,
      textColor: textColor,
    ),
  );
}

Widget assetImage({var image, var height, var width}) {
  return Image.asset(
    image,
    height: height,
    width: width,
    fit: BoxFit.contain,
  );
}

Widget assetImageColor({var image, var height, var width, var color}) {
  return Image.asset(
    image,
    height: height,
    width: width,
    fit: BoxFit.contain,
    color: color,
  );
}

Widget customEmailFiled(
    {TextEditingController? textEditingController, var hint, bool enabled = true}) {
  // required
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      border: Border.all(color: borderColor, width: 0.5),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: white,
    ),
    child: Row(
      children: [
        // Visibility(
        //   visible: false,
        //   child: Container(
        //     padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4.0),
        //     child: assetImageColor(
        //         color: Colors.grey[400],
        //         image: 'assets/ic_mail.png',
        //         height: SizeConfig.safeBlockHorizontal * 4.5,
        //         width: SizeConfig.safeBlockHorizontal * 4.5),
        //   ),
        // ),
        Expanded(
          flex: 1,
          child: TextField(
            enabled: enabled ,
            controller: textEditingController,
            style: customTextStyleRegular(
                fontSize: 4.0, textColor: black20),
            decoration:  InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: hint,
              hintStyle: customTextStyleRegular(
                  fontSize: 4.0, textColor: MyColors.grayText),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget customPasswordField(
    {TextEditingController? textEditingController,
    var hint,
    var isVisible, void Function()? onTap}) {
  // required
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      border: Border.all(color: borderColor, width: 0.5),
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: white,
    ),
    child: Row(
      children: [
        // Container(
        //   padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4.0),
        //   child: assetImageColor(
        //       color: Colors.grey[400],
        //       image: 'assets/ic_lock.png',
        //       height: SizeConfig.safeBlockHorizontal * 4.5,
        //       width: SizeConfig.safeBlockHorizontal * 4.5),
        // ),
        Expanded(
          flex: 1,
          child: TextField(
            obscureText: true,
            controller: textEditingController,
            style: customTextStyleRegular(
                fontSize: 4.0, textColor: MyColors.black),
            decoration:  InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: hint,
              hintStyle: customTextStyleRegular(
                  fontSize: 4.0, textColor: MyColors.grayText),
            ),
          ),
        ),
        // isVisible
        //     ? Container(
        //         padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4.0),
        //         child: assetImage(
        //             image: 'assets/ic_visible.png',
        //             height: SizeConfig.safeBlockHorizontal * 4.5,
        //             width: SizeConfig.safeBlockHorizontal * 5.0),
        //       )
        //     : Container(
        //         padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4.0),
        //         child: assetImageVisible(
        //             image: 'assets/ic_visible.png',
        //             height: SizeConfig.safeBlockHorizontal * 5.0,
        //             width: SizeConfig.safeBlockHorizontal * 5.0),
        //       ),
      ],
    ),
  );
}

Widget customNumberFiled(
    {TextEditingController? textEditingController, var hint}) {
  // required
  return Container(
    padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 0.5),
    decoration: BoxDecoration(
      border: Border.all(color: borderColor, width: 0.5),
      borderRadius: BorderRadius.all(Radius.circular(100)),
      color: white,
    ),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3.5),
          child: assetImage(
              image: 'assets/ic_cellphone.png',
              height: SizeConfig.safeBlockHorizontal * 5.0,
              width: SizeConfig.safeBlockHorizontal * 5.0),
        ),
        Expanded(
          flex: 1,
          child: TextField(
            controller: textEditingController,
            style: customTextStyleRegular(
                fontSize: 4.0, textColor: MyColors.black),
            textAlign: TextAlign.start,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],
            decoration:  InputDecoration(
              counterText: "",
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: hint,
              hintStyle: customTextStyleRegular(
                  fontSize: 4.0, textColor: MyColors.grayText),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget commonTextFiled(
    {TextEditingController? textEditingController, var hint}) {
  // required
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 7.0,
        vertical: SizeConfig.safeBlockHorizontal * 0.5),
    decoration: BoxDecoration(
      border: Border.all(color: borderColor, width: 0.6),
      borderRadius: BorderRadius.all(Radius.circular(100)),
      color: white,
    ),
    child: TextField(
      controller: textEditingController,
      style: customTextStyleRegular(fontSize: 4.0, textColor: MyColors.black),
      decoration:  InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: hint,
        hintStyle:
            customTextStyleRegular(fontSize: 4.0, textColor: MyColors.grayText),
      ),
    ),
  );
}

Widget customSearch(
    {TextEditingController? textEditingController,
    var hint,
      void Function()? onFieldSubmitted}) {
  // required
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: bgSearch),
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      color: bgSearch,
    ),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4.3),
          child: assetImage(
              image: 'assets/ic_search.png',
              height: SizeConfig.safeBlockHorizontal * 4.7,
              width: SizeConfig.safeBlockHorizontal * 4.7),
        ),
        Expanded(
          flex: 1,
          child: TextFormField(
            controller: textEditingController,
            style: customTextStyleRegular(
                fontSize: 4.0, textColor: MyColors.black),
            maxLines: 1,
            onFieldSubmitted: (_) =>
                {if (onFieldSubmitted != null) onFieldSubmitted()},
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: hint,
              hintStyle: customTextStyleRegular(
                  fontSize: 4.0, textColor: MyColors.grayText),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget customEditTextField({
  TextEditingController? textEditingController,
  var hint,
}) {
  // required
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 5.0,
        vertical: SizeConfig.safeBlockHorizontal * 0.5),
    decoration: BoxDecoration(
      border: Border.all(color: borderColor, width: 1.5),
      borderRadius: BorderRadius.all(Radius.circular(100)),
      color: white,
    ),
    child: TextFormField(
      controller: textEditingController,
      style: customTextStyleRegular(fontSize: 4.0, textColor: MyColors.black),
      maxLines: 1,
      decoration: InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: hint,
        hintStyle:
            customTextStyleRegular(fontSize: 4.0, textColor: MyColors.grayText),
      ),
    ),
  );
}

Widget backArrowAppBarAuth({required Function onTab}) {
  return IconButton(
    icon: Icon(
      Icons.arrow_back_ios,
      color: MyColors.BlueAppColor,
      size: SizeConfig.safeBlockHorizontal * 6.0,
    ),
    onPressed: () => {
     // Get.back(),
    },
  );
}

Widget backArrowAppBar({required Function onTab}) {
  return IconButton(
    icon: Icon(
      Icons.arrow_back_ios,
      color: MyColors.black,
      size: SizeConfig.safeBlockHorizontal * 6.0,
    ),
    onPressed: () => onTab(),
  );
}

AppBar customAppBar({required var title, required Function onTab, bool showBackBtn = true  }) {
  return AppBar(
    flexibleSpace: Container(
      decoration: BoxDecoration(
        /*gradient: LinearGradient(
          colors: [
            MyColors.BlueAppColor,
            ColorResources.primaryColor,
          ],
        ),*/
      ),
    ),
    centerTitle: true,
    leading: showBackBtn ? backArrowAppBar(onTab: onTab) : null,

    title: customTextMedium(text: title, fontSize: 5.0, textColor: Colors.black),
  );
}

Widget getCircleImage (String path) {
  return CachedNetworkImage(
    imageUrl: path,
    imageBuilder: (context, imageProvider) => Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: imageProvider, fit: BoxFit.cover),
      ),
    ),
    placeholder: (context, url) => const CircularProgressIndicator(),
    errorWidget: (context, url, error) => const Icon(Icons.account_circle),
  );
}