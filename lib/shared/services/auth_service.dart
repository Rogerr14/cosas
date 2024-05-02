import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prueba_telconet/shared/models/user_model.dart';

class FirebaseAuthentication {
  FirebaseAuth auth = FirebaseAuth.instance;
  var db = FirebaseFirestore.instance;

  Future<bool> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      debugPrint('${userCredential.user!.email}');
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('La contraseña debe ser más segura.');
      } else if (e.code == 'email-already-in-use') {
        print('El correo electrónico ya está en uso.');
      } else {
        print('Error de registro: ${e.code}');
      }
      return false;
    }
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      debugPrint('${userCredential.user!.email}');

      // final data = {"capital": true};

      // db.collection("cities").doc("").set(data, SetOptions(merge: true));
      final rol = db.collection("users");
      final snapshot = await rol.where("email", isEqualTo: email).withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (UserModel user, _) => user.toFirstore());
      final docSnap = snapshot.get();
      final userInfo = docSnap.then((value) => value.docs);
      
      debugPrint('lista: $userInfo');
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Usuario no encontrado.');
      } else if (e.code == 'wrong-password') {
        print('Contraseña incorrecta.');
      } else {
        print('Error de autenticación: ${e.code}');
      }
      return false;
    }
  }
}
