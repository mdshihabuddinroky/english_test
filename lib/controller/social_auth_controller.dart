import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SocialController extends GetxController {
  var name = "".obs;
  var email = "".obs;
  signInwithApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      if (credential.isBlank == false) {
        name(credential.givenName);
        email(credential.email);
      }
      print(credential);
    } catch (e) {
      e.printError();
    }
  }

  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn().catchError((e) {
      print(e);
    });

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication.catchError((e) {
      print(e);
    });
    if (googleUser.isBlank == false) {
      name(googleUser!.displayName);
      email(googleUser.email);
    }
    // Create a new credential
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth?.accessToken,
    //   idToken: googleAuth?.idToken,
    // );

    // // Once signed in, return the UserCredential
    // try {
    //   await FirebaseAuth.instance.signInWithCredential(credential);
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'account-exists-with-different-credential') {
    //     Get.snackbar("Failed",
    //         "This email is already registered with different crediential");
    //   }
    // }
  }

  signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login(
      permissions: ['public_profile', 'email', 'name', 'id'],
    );

    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.i.getUserData(
        fields: "name,email,picture.width(200)",
      );
      name(userData["name"]);
      email(userData["email"]);
    }
  }
}
