import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseMethod {
  Future<void> addUserInfo(Map<String, dynamic> userInfoMap, String id) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }
}
