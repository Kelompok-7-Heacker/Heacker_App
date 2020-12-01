import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User> signIn(String email, String password) async {
    print(email);
    print(password);

    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<User> signUp(
      String name, String email, String password, String gender) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      print('User UID: ${user.uid}');
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        "name": name,
        "email": email,
        "gender": gender,
        "status": "Pasien",
      });
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // static Future<User> signUp(
  //     String name, String email, String password, String gender) async {
  //   try {
  //     UserCredential result = await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     User user = result.user;
  //     // await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
  //     //   "name": name,
  //     //   "gender": gender,
  //     //   "status": "Pasien",
  //     // });
  //     return user;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  static Future<void> signOut() async {
    _auth.signOut();
  }

  static Future<String> currentUser() async {
    User user = FirebaseAuth.instance.currentUser;
    return user.uid;
  }
}
