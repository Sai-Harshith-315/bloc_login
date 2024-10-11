import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/address_model.dart';
import '../models/user_model.dart';

class AuthFirebaseData {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //users collection
  Future<void> addUserToFirestoreWithBatch(
      UserModel userModel, AddressModel addressModel) async {
    WriteBatch batch = firebaseFirestore.batch();

    // Reference to the user's document
    final userRef = firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid);

    // Set user data
    batch.set(userRef, userModel.toJson());

    // Reference to the address sub-collection
    final addressRef = userRef.collection('addresses').doc();

    // Set address data
    batch.set(addressRef, addressModel.toJson());

    // Commit the batch
    try {
      await batch.commit();
      print('User and address successfully added to Firestore with a batch.');
    } catch (e) {
      print('Error adding user and address with batch: $e');
    }
  }
}
