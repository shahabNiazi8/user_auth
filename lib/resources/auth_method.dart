import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/resources/storage_method.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String user,
    required String email,
    required String password,
    required String confirmpassword,
    required Uint8List file,
  }) async {
    String res = "some error occur";
    try {
      if (user.isNotEmpty ||
          email.isNotEmpty ||
          password.isNotEmpty ||
          confirmpassword.isNotEmpty ||
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profile pic', file!, false);
        await _firestore.collection('user').doc(cred.user!.uid).set({
          'user': user,
          'uid': cred.user!.uid,
          'email': email,
          'password': password,
          'confirmpassword': confirmpassword,
          'follower': [],
          'following': [],
          'photo url': photoUrl
        });
        res = "success";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid email') {
        res = "email is badly formated";
      } else if (err.code == 'week password') {}
    } catch (err) {
      res = Error().toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "some error occur";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "sucess";
      } else {
        res = "plaease enter all the fields";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
