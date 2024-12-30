import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shop_ease/consts/consts.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:shop_ease/controllers/home_controller.dart'; // Add this for BuildContext

class AuthController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isLoading = false.obs;

  // Login Methode
  Future<UserCredential?> LoginMethode({
    required BuildContext context,
    //required String email,
    //required String password,
  }) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: "Error: ${e.message}");
    }
    return userCredential;
  }

  // SignUp Methode
  Future<UserCredential?> SignUpMethode({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: "Error: ${e.message}");
    }
    return userCredential;
  }

  // Storing data Methode
  Future<void> StoreUserData({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      DocumentReference store =
          firestore.collection(userCollection).doc(currentUser!.uid);
      await store.set({
        'name': name,
        'email': email,
        'password': password,
        'imageURL': '',
        "id": currentUser!.uid,
        "cart_count": "00",
        "wishlist_count": "00",
        "orders_count": "00",
        // Empty string for now, you can update later
      });
    } catch (e) {
      debugPrint('Error storing user data: $e');
    }
  }

  // Signout Methode
  Future<void> signoutMethode(BuildContext context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: "Error: ${e.toString()}");
    }
  }
}
