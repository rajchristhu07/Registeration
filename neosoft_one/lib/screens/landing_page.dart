import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:neosoftflutter/screens/pages/user_list.dart';

import '../utility/theme.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 60,
          elevation: 1,
          shadowColor: whiteColor,
          foregroundColor: whiteColor,
          centerTitle: true,
          title: Text(
            "Users",
            textAlign: TextAlign.start,
            style: TextStyle(
                color: blackColor, fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
          backgroundColor: whiteColor,
        ),
        body: Stack(children: <Widget>[


        MediaQuery.removePadding(
        context: context,
            removeTop: true,
            child: ListView.builder(
              itemCount: 100,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [UserList()],
                    ));
              },
            )),
          Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 64,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: HexColor("#283265"),
                    onPrimary: Colors.white,
                    // side: BorderSide(color: Colors.red, width: 1),
                    textStyle: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.montserrat().fontFamily),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Register'),
                ),
              ))
        ]));
  }
}
