import 'dart:typed_data';

class User {
  String? firstName;
  String? lastName;
  String? mobileNo;
  String? emailId;
  String? picture;


  User(this.firstName, this.lastName, this.mobileNo, this.emailId, this.picture);
  User.fromMap(Map map) {
    firstName = map[firstName];
    lastName = map[lastName];
    mobileNo = map[mobileNo];
    emailId = map[emailId];
    picture = map[picture];
  }
  Map<String, dynamic> toMap() => {
    "firstName": firstName,
    "lastName": lastName,
    "mobileNo": mobileNo,
    "emailId": emailId,
    "picture" : picture,
  };
}