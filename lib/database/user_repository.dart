import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:marketplace_app/constants/colors.dart';
import 'package:marketplace_app/database/user_model.dart';
import 'package:flutter/material.dart';

// USER REPOSITORY TO PERFORM DATABASE OPERATIONS

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar(
            "Success",
            "Your Account has been created.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: kDefaultRedColor,
            colorText: Colors.black,
          ),
        )
        .catchError((error, stackTree) {
      Get.snackbar(
        "Error",
        "Something went Wrong, try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kDefaultRedColor,
        colorText: Colors.black,
      );
    });
  }
}
