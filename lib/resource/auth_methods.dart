import 'package:eventry/models/firebase/user_model.dart';
import 'package:eventry/resource/firestore_methods.dart';
import 'package:eventry/resource/hive_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // sign in
  Future<String> signInUser({required String email, required String password}) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        String uid = userCredential.user!.uid;
        await FirestoreMethods().getUser(uid);
        res = "success";
      } else {
        res = "All fields are required";
      }
    } on FirebaseAuthException catch(err) {
      if (err.code == "invalid-email") {
        res = "Invalid email address";
      } else if (err.code == "weak-password") {
        res = "Your password should be at least 6 characters";
      } else if (err.code == "wrong-password") {
        res = "Your password is incorrect";
      } else if (err.code == "user-not-found") {
        res = "Account not available. Check your email and password";
      } else {
        res = err.code;
      }
    } catch(err) {
      res = err.toString();
    }
    return res;
  }

  // sign in
  Future<String> createAccount({required String phone, required String email, required String password, required String name}) async {
    String res = "Some error occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
        User? authUser = userCredential.user;
        await authUser?.sendEmailVerification();
        UserModel user = UserModel(
            phone: phone.trim(),
            fullName: name.trim(),
            email: email,
            uid: authUser?.uid
        );
        await FirestoreMethods().addUser(user);
        await HiveRepository().saveUserData(user);
        res = "success";
      } else {
        res = "All fields are required";
      }
    } on FirebaseAuthException catch(err) {
      if (err.code == "invalid-email") {
        res = "Invalid email address";
      } else if (err.code == "weak-password") {
        res = "Your password should be at least 6 characters";
      } else if (err.code == "email-already-in-use") {
        res = "Email already exists";
      } else {
        res = err.code;
      }
    } catch(err) {
      res = err.toString();
    }
    return res;
  }

  void logout() async {
    await _firebaseAuth.signOut();
  }
}
