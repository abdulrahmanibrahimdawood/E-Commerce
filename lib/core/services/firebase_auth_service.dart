import 'dart:developer' as dev;
import 'dart:io';
import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart'
    show GoogleSignInAccount, GoogleSignIn, GoogleSignInAuthentication;
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      dev.log(
        'Exception in FirebaseAuthService.CreateUserWithEmailAndPassword: ${e.message} and code is ${e.code}',
      );
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: 'لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'لا يوجد اتصال بالانترنت.');
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: 'صيغة البريد الإلكتروني غير صحيحة.');
      } else {
        throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        );
      }
    } catch (e) {
      throw CustomException(
        message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
      );
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      dev.log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}',
      );
      if (e.code == 'user-not-found') {
        throw CustomException(
          message: 'الرقم السري او البريد الالكتروني غير صحيح.',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          message: 'الرقم السري او البريد الالكتروني غير صحيح.',
        );
      } else if (e.code == 'invalid-credential') {
        throw CustomException(
          message: 'الرقم السري او البريد الالكتروني غير صحيح.',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'لا يوجد اتصال بالانترنت.');
      } else {
        throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        );
      }
    } catch (e) {
      dev.log(
        'Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}',
      );
    }
    throw CustomException(
      message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
    );
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);
    final LoginResult loginResult = await FacebookAuth.instance.login(
      nonce: nonce,
    );
    OAuthCredential facebookAuthCredential;

    if (Platform.isIOS) {
      switch (loginResult.accessToken!.type) {
        case AccessTokenType.classic:
          final token = loginResult.accessToken as ClassicToken;
          facebookAuthCredential = FacebookAuthProvider.credential(
            token.authenticationToken!,
          );
          break;
        case AccessTokenType.limited:
          final token = loginResult.accessToken as LimitedToken;
          facebookAuthCredential = OAuthCredential(
            providerId: 'facebook.com',
            signInMethod: 'oauth',
            idToken: token.tokenString,
            rawNonce: rawNonce,
          );
          break;
      }
    } else {
      facebookAuthCredential = FacebookAuthProvider.credential(
        loginResult.accessToken!.tokenString,
      );
    }

    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }

  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<User> signInWithApple() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    final oauthCredential = OAuthProvider(
      "apple.com",
    ).credential(idToken: appleCredential.identityToken, rawNonce: rawNonce);

    return (await FirebaseAuth.instance.signInWithCredential(
      oauthCredential,
    )).user!;
  }
}
