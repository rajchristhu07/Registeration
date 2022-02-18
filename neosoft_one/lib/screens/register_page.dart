import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neosoftflutter/screens/address_page.dart';
import 'package:neosoftflutter/screens/pages/user_list.dart';

import '../utility/text_style.dart';
import '../utility/theme.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  File? _image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }
  var _formKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    else{
      print("yes");
    }
    _formKey.currentState!.save();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          toolbarHeight: 60,
          elevation: 0,
          shadowColor: whiteColor,
          foregroundColor: whiteColor,
          centerTitle: true,
          title: Text(
            "Register",
            textAlign: TextAlign.start,
            style: TextStyle(
                color: blackColor, fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
          backgroundColor: whiteColor,
        ),
        body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Container(
              padding: EdgeInsets.only(right: 40, left: 40),
              child: Form(
    key: _formKey,
    child:

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CircleAvatar(
                            radius: 51,
                            backgroundColor: grayColor,
                            child: _image != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.file(
                                      _image!,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    width: 100,
                                    height: 100,
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                          ),
                        ),
                        const Positioned(
                            right: 0,
                            bottom: 40,
                            child: Icon(
                              Icons.edit,
                              color: Colors.black,
                              size: 24,
                            ))
                      ],
                    ),
                  )),
                  Text(
                    "First Name*",
                    style: titleDefaultTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Container(
                      height: 44,
                      child: TextFormField(
                        key: ValueKey('first_name'),
                        validator: (value) {
                          if (value!.length<3) {
                            return 'Enter a valid first name!';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r"[a-zA-Z]+|\s"))
                        ],
                        onChanged: (value) {
                          // name = value;
                        },
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          prefixIcon:  Icon(Icons.person,color: primaryColor,),
                            hintText: 'Enter your first name here',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: HexColor("#383838"),
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          errorStyle: TextStyle(fontSize: 9, height: 0),

                          errorBorder: const OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(0.0)),
                            borderSide:
                            BorderSide(color: Colors.red, width: 1),
                          ),
                          focusedErrorBorder:  const OutlineInputBorder(

                            borderRadius:
                            BorderRadius.all(Radius.circular(0.0)),
                            borderSide:
                            BorderSide(color: Colors.red, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(0.0)),
                            borderSide: BorderSide(color: blackColor, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0)),
                            borderSide: BorderSide(color: blackColor, width: 1),
                          ),
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          //     borderSide: BorderSide(color: HexColor("#E2E2E2"), width: 1),
                          //
                          // ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Last Name*",
                    style: titleDefaultTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Container(
                      height: 44,
                      child: TextFormField(
                        key: ValueKey('last_name'),
                        validator: (value) {
                          if (value!.length<3) {
                            return 'Enter a valid last name!';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r"[a-zA-Z]+|\s"))
                        ],
                        onChanged: (value) {
                          // name = value;
                        },
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          prefixIcon:  Icon(Icons.person,color: primaryColor,),
                          hintText: 'Enter your last name here',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: HexColor("#383838"),
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          errorStyle: TextStyle(fontSize: 9, height: 0),

                          errorBorder: const OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(0.0)),
                            borderSide:
                            BorderSide(color: Colors.red, width: 1),
                          ),
                          focusedErrorBorder:  const OutlineInputBorder(

                            borderRadius:
                            BorderRadius.all(Radius.circular(0.0)),
                            borderSide:
                            BorderSide(color: Colors.red, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(0.0)),
                            borderSide: BorderSide(color: blackColor, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0)),
                            borderSide: BorderSide(color: blackColor, width: 1),
                          ),
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          //     borderSide: BorderSide(color: HexColor("#E2E2E2"), width: 1),
                          //
                          // ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Phone Number*",
                    style: titleDefaultTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Container(
                      height: 44,
                      child: TextFormField(
                        key: ValueKey('name'),
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value!.length<10) {
                            return 'Enter a valid phoneno!';
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9]'))
                        ],
                        onChanged: (value) {
                          // name = value;
                        },
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          prefixIcon:  Icon(Icons.phone,color: primaryColor,),
                          hintText: 'Enter your last name here',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: HexColor("#383838"),
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),

                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(0.0)),
                            borderSide: BorderSide(color: blackColor, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0)),
                            borderSide: BorderSide(color: blackColor, width: 1),
                          ),
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          //     borderSide: BorderSide(color: HexColor("#E2E2E2"), width: 1),
                          //
                          // ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Email*",
                    style: titleDefaultTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Container(
                      height: 44,
                      child: TextFormField(
                        key: ValueKey('name'),
                        keyboardType: TextInputType.name,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r"[a-zA-Z]+|\s"))
                        ],
                        onChanged: (value) {
                          // name = value;
                        },
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          prefixIcon:  Icon(Icons.email,color: primaryColor,),
                          hintText: 'Enter your last name here',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: HexColor("#383838"),
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),

                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(0.0)),
                            borderSide: BorderSide(color: blackColor, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0)),
                            borderSide: BorderSide(color: blackColor, width: 1),
                          ),
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          //     borderSide: BorderSide(color: HexColor("#E2E2E2"), width: 1),
                          //
                          // ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Password*",
                    style: titleDefaultTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Container(
                      height: 44,
                      child: TextFormField(
                        key: ValueKey('name'),
                        keyboardType: TextInputType.name,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r"[a-zA-Z]+|\s"))
                        ],
                        onChanged: (value) {
                          // name = value;
                        },
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          prefixIcon:  Icon(Icons.lock,color: primaryColor,),
                          hintText: 'Enter your last name here',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: HexColor("#383838"),
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),

                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(0.0)),
                            borderSide: BorderSide(color: blackColor, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0)),
                            borderSide: BorderSide(color: blackColor, width: 1),
                          ),
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          //     borderSide: BorderSide(color: HexColor("#E2E2E2"), width: 1),
                          //
                          // ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Confirm Password",
                    style: titleDefaultTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Container(
                      height: 44,
                      child: TextFormField(
                        key: ValueKey('name'),
                        keyboardType: TextInputType.name,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r"[a-zA-Z]+|\s"))
                        ],
                        onChanged: (value) {
                          // name = value;
                        },
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          prefixIcon:  Icon(Icons.lock,color: primaryColor,),
                          hintText: 'Enter your last name here',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: HexColor("#383838"),
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),

                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(0.0)),
                            borderSide: BorderSide(color: blackColor, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(0.0)),
                            borderSide: BorderSide(color: blackColor, width: 1),
                          ),
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          //     borderSide: BorderSide(color: HexColor("#E2E2E2"), width: 1),
                          //
                          // ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FlatButton(
                    minWidth: MediaQuery.of(context).size.width,
                      height: 50,
                      color: primaryColor,
                      textColor: Colors.white,
                      child: const Text('Next',style: TextStyle(fontSize:18,fontWeight: FontWeight.bold),),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddressPage()),
                        );
                      }),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),)
            )));
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Photo Library'),
                      onTap: () {
                        getImage();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      getImageCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
