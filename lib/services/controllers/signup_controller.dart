import 'package:get/get.dart';
import '../repo/auth_service_repo.dart';

class LoginController extends GetxController {
  final AuthServiceRepo authServiceRepo = AuthServiceRepo();

  // Observables for form fields
  var name = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var address = ''.obs; // To handle dropdown selection for address

  // Error messages for validation
  var nameError = ''.obs;
  var emailError = ''.obs;
  var phoneError = ''.obs;
  var passwordError = ''.obs;
  var confirmPasswordError = ''.obs;
  var addressError = ''.obs;

  // Observable for password visibility toggle
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  // Method to call the signup service
  Future<void> signUpUser() async {
    if (_validateForm()) {
      await authServiceRepo.signUpServices(
          name.value, email.value, phone.value, password.value, address.value);
    }
  }

  // Validation logic for the entire form
  bool _validateForm() {
    validateName(name.value);
    validateEmail(email.value);
    validatePhone(phone.value);
    validatePassword(password.value);
    validateConfirmPassword(confirmPassword.value);

    return nameError.value.isEmpty &&
        emailError.value.isEmpty &&
        phoneError.value.isEmpty &&
        passwordError.value.isEmpty &&
        confirmPasswordError.value.isEmpty &&
        addressError.value.isEmpty;
  }

  // Validation logic for name
  void validateName(String value) {
    if (value.isEmpty) {
      nameError.value = 'Name cannot be empty';
    } else {
      nameError.value = '';
    }
  }

  // Validation logic for email
  void validateEmail(String value) {
    if (value.isEmpty) {
      emailError.value = 'Email cannot be empty';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      emailError.value = 'Please enter a valid email';
    } else {
      emailError.value = '';
    }
  }

  // Validation logic for phone number
  void validatePhone(String value) {
    if (value.isEmpty) {
      phoneError.value = 'Phone number cannot be empty';
    } else if (!RegExp(r'^[6789]\d{9}$').hasMatch(value)) {
      phoneError.value =
          'Phone number must start with 6, 7, 8, or 9 and be 10 digits long';
    } else {
      phoneError.value = '';
    }
  }

  // Validation logic for password
  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError.value = 'Password cannot be empty';
    } else if (value.length < 6) {
      passwordError.value = 'Password must be at least 6 characters long';
    } else {
      passwordError.value = '';
    }
  }

  // Validation logic for confirm password
  void validateConfirmPassword(String value) {
    if (value.isEmpty) {
      confirmPasswordError.value = 'Confirm Password cannot be empty';
    } else if (value != password.value) {
      confirmPasswordError.value = 'Passwords do not match';
    } else {
      confirmPasswordError.value = '';
    }
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Toggle confirm password visibility
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }
}
