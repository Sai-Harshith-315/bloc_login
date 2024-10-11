import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class FirebaseAuthData {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // Add user to Firestore
  Future<void> addUserToFirestore(UserModel userModel) async {
    try {
      User? currentUser = firebaseAuth.currentUser;
      if (currentUser != null) {
        await firebaseFirestore
            .collection('users')
            .doc(currentUser.uid)
            .set(userModel.toJson());
      } else {
        print('User is not authenticated');
      }
    } catch (e) {
      print('Error adding user to Firestore: $e');
    }
  }

  // Fetch user from Firestore
  Future<DocumentSnapshot?> fetchUserFromFirestore(String uId) async {
    try {
      return await firebaseFirestore.collection('users').doc(uId).get();
    } catch (e) {
      print('Error fetching user from Firestore: $e');
      return null;
    }
  }
}
