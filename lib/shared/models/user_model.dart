import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  List<dynamic> singin;
  String email;
  String rol;
  String lastname;

  UserModel({
    required this.name,
    required this.singin,
    required this.email,
    required this.rol,
    required this.lastname,
  });

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    
  ) {
    final data = snapshot.data();
    return UserModel(
        name: data?["name"],
        singin: data?["singin"],
        email: data?["email"],
        rol: data?["rol"],
        lastname: data?["lastname"]);
  }

  Map<String, dynamic> toFirstore() => {
        "name": name,
        "singin": singin,
        "email": email,
        "rol": rol,
        "lastname": lastname,
      };
}
