import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth extends GetxController {
  Rx<User> user = Rx<User>();
  FirebaseAuth auth = FirebaseAuth.instance;

  GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: ['email', "https://www.googleapis.com/auth/userinfo.profile"]);

  Future<User> signingoogle() async {
    final result = await googleSignIn.signIn();
    final authentication = await result.authentication;
    GoogleAuthCredential credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken, accessToken: authentication.idToken);
    user.value =
        await auth.signInWithCredential(credential).then((value) => value.user);

    FirebaseFirestore.instance.collection("user").add({
      "userid": user.value.uid,
      "username": user.value.displayName,
      "email": user.value.email,
      "photo_url": user.value.photoURL,
      "reaction": [],
      "comment": [],
      "bookmark": [],
    });

    return user.value;
  }

  Future<void> signout() async {
    await googleSignIn.signOut();
    await auth.signOut();
  }
}
