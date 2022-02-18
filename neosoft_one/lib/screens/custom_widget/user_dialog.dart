import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:neosoftflutter/utility/theme.dart';

import '../../utility/text_style.dart';

class CustomUserDetailDialogBox extends StatefulWidget {
  final String title, descriptions, text;

  const CustomUserDetailDialogBox(
      {Key? key,
      required this.title,
      required this.descriptions,
      required this.text})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomUserDetailDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 70.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 0),
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    icon: Container(
                      padding: const EdgeInsets.all(0.0),
                      height: 50.0,
                      width: 50.0,
                      child: const Center(
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 19.0,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 2,
                color: HexColor("#E2E2E2"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  "Basic Info",
                  style: titleDefaultTextStyle,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        // optional flex property if flex is 1 because the default flex is 1
                        flex: 1,
                        child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(30),
                                    // Image radius
                                    child: Image.asset("assets/pic.jpg",
                                        height: 60.0, width: 60.0, fit: BoxFit.cover),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Text("raj@gmail.com",style: titleMediumDefaultTextStyle,),
                                Text("9597138105",style: titleMediumDefaultTextStyleBlack,),
                              ],
                            )

                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        // optional flex property if flex is 1 because the default flex is 1
                        flex: 2,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Raj",
                                  //         widget.contentList[index].name.toString(),
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: HexColor("#1C1C1C"),
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  "Software Engineer",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: primaryColor,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.start,
                                ),

                                const SizedBox(
                                  height: 6,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width/2,
                                  child:    Text(
                                    "jbhabsdhjbs dhubsabdubasd yasdabsdyasua asdhbasduasbdbas dubudasbdasbdbbasd  ydasbhasubdasbudb ydasbduyas",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: HexColor("#1C1C1C"),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),

                      // SizedBox(
                      //   width: 24,
                      // ),
                    ],
                  )),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 2,
                color: HexColor("#E2E2E2"),
              ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Educational Info",
                  style: titleDefaultTextStyle,
                ),
                Text(
                  "Graduate",
                  style: paragraphRegularDefaultTextStyle,
                ), Text(
                  "Graduate",
                  style: paragraphRegularDefaultTextStyle,
                ), Text(
                  "Graduate",
                  style: paragraphRegularDefaultTextStyle,
                ),

              ],
            )),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 2,
                color: HexColor("#E2E2E2"),
              ),
              SizedBox(height: 10,),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Professional Info",
                        style: titleDefaultTextStyle,
                      ),
                      Text(
                        "Graduate",
                        style: paragraphRegularDefaultTextStyle,
                      ), Text(
                        "Graduate",
                        style: paragraphRegularDefaultTextStyle,
                      )

                    ],
                  )),
              SizedBox(height: 50,),


            ],
          ),
        ));
  }
}
