import 'package:firebase_database/firebase_database.dart';

class USerModel {
  String? phone;
  String? name;
  String? id;
  String? email;
  String? address;

  USerModel({
    this.name,
    this.phone,
    this.email,
    this.id,
    this.address,
  });

  USerModel.fromSnapshot(DataSnapshot snap) {
    phone = (snap.value as dynamic)["phone"];
    name = (snap.value as dynamic)["name"];
    id = snap.key;
    email = (snap.value as dynamic)["email"];
    address = (snap.value as dynamic)["address"];
  }
}
