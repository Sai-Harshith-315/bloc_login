// ignore_for_file: avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../data/auth_data/auth_firebase_data.dart';
import '../../data/models/address_model.dart';
import '../../data/models/user_model.dart';

class AuthServiceRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final AuthFirebaseData userData = AuthFirebaseData();

  // SignUp functionality
  Future<UserCredential?> signUpServices(
    String fullName,
    String email,
    String phoneNumber,
    String password,
    String addressLine1,
    String addressLine2,
    String city,
    String state,
    String postalCode,
    String country,
  ) async {
    try {
      // Create the user with Firebase Authentication
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Create UserModel object
      UserModel userModel = UserModel(
        userId: userCredential.user!.uid,
        fullName: fullName,
        email: email,
        phoneNumber: phoneNumber,
        passwordHash: '', // Store the hashed password securely
        role: UserRole.Customer,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // Create AddressModel object
      AddressModel addressModel = AddressModel(
        addressLine1: addressLine1,
        addressLine2: addressLine2,
        city: city,
        state: state,
        postalCode: postalCode,
        country: country,
        isDefault: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      // Add the user and address data to Firestore using the Data Layer method
      await userData.addUserToFirestoreWithBatch(userModel, addressModel);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle any Firebase Auth errors and show the error message using GetX
      Get.snackbar(
        'Error',
        e.message ?? "An error occurred during signup in repo.",
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    } catch (e) {
      print('Error during sign up: $e');
      return null;
    }
  }
}
