import 'dart:typed_data';

class User {
  String? firstName;
  String? lastName;
  String? mobileNo;
  String? emailId;
  String? password;
  String? gender;
  String? picture;
  String? address;
  String? landmark;
  String? city;
  String? state;
  String? pincode;

  User(
      this.firstName,
      this.lastName,
      this.mobileNo,
      this.emailId,
      this.password,
      this.gender,
      this.picture,
      this.address,
      this.landmark,
      this.city,
      this.state,
      this.pincode);

  User.fromMap(Map map) {
    firstName = map[firstName];
    lastName = map[lastName];
    mobileNo = map[mobileNo];
    emailId = map[emailId];
    password = map[password];
    gender = map[gender];
    picture = map[picture];
    address = map[address];
    landmark = map[landmark];
    city = map[city];
    state = map[state];
    pincode = map[pincode];
  }

  Map<String, dynamic> toMap() => {
        "firstName": firstName,
        "lastName": lastName,
        "mobileNo": mobileNo,
        "emailId": emailId,
        "password": password,
        "gender": gender,
        "picture": picture,
        "address": address,
        "landmark": landmark,
        "city": city,
        "state": state,
        "pincode": pincode,
      };
}
