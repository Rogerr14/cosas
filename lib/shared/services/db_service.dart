import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prueba_telconet/shared/models/user_model.dart';

class FirebaseDatabaseServices {
  var db = FirebaseFirestore.instance;
  String rol = '';

  List<UserModel>  usuarios = [];

  Future<void> getAllRegistry() async {
    usuarios.clear();
    await db.collection("users").get().then(
      (querySnapshot) {
        print("Successfully completed");
        debugPrint('$querySnapshot');
        for (var docSnapshot in querySnapshot.docs) {
          debugPrint('${docSnapshot.data()["name"]}');
          usuarios.add( UserModel(name: docSnapshot.data()["name"], singin: docSnapshot.data()["singin"], email: docSnapshot.data()["email"], rol: docSnapshot.data()["rol"], lastname: docSnapshot.data()["lastname"]));
          print(usuarios.last.name);
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  getRollUser(String email) async{
    debugPrint('entra al roll');
    await db
        .collection("users")
        .where("email", isEqualTo: email)
        .get()
        .then((querySnapshot) {
      // debugPrint('${querySnapshot.docs}');
      // for (var docSnapshot in querySnapshot.docs) {
      //   debugPrint('${docSnapshot.data()["rol"]}');
        
      //   rol = docSnapshot.data()["rol"];
      // }
        final user = UserModel.fromFirestore(querySnapshot.docs.first);
        // debugPrint(rol);
        rol = user.rol;
      });
    return rol;
  }

  createUser({required String name,required String lastName, required String email}) {
    // Add a new document with a generated id.
    final data = {
      "name": name,
      "singin": [],
      "rol" : "user",
      "email" : email,
      "lastname" : lastName ,
    };

    db.collection("users").add(data).then((documentSnapshot) =>
        print("Added Data with ID: ${documentSnapshot.id}"));
  }
}
