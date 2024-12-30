import 'package:shop_ease/consts/firebase_consts.dart';

//get users data from firestore
class FirestoreServices {
  static getUser(uid) {
    return firestore
        .collection(userCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }
}
