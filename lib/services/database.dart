import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  Future addUserInfo(Map<String, dynamic> userInfoMap, String id) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

  Future addProductInfo(Map<String, dynamic> productInfoMap) async {
    return FirebaseFirestore.instance
        .collection("products")
        .add(productInfoMap);
  }

  Future<Stream<QuerySnapshot>> getallProducts(String category) async {
    return await FirebaseFirestore.instance
        .collection("products")
        .where("Category", isEqualTo: category)
        .snapshots();
  }
}
