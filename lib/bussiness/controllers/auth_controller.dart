import 'package:get/get.dart';
import '../../domain/repositories/auth_service_repo.dart';

class AuthController extends GetxController {
  final AuthServiceRepo authServiceRepo;

  // Observables
  var isLoading = false.obs;

  AuthController({required this.authServiceRepo});

  // Sign up method
  Future<void> signUp(String email, String password) async {
    try {
      isLoading.value = true;
      await authServiceRepo.signUp(email, password);
      Get.snackbar('Success', 'User signed up successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign up');
    } finally {
      isLoading.value = false;
    }
  }

  // Login method
  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;
      await authServiceRepo.login(email, password);
      Get.snackbar('Success', 'Logged in successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to log in');
    } finally {
      isLoading.value = false;
    }
  }

  // Optional logout method
  Future<void> logout() async {
    await authServiceRepo.logout();
    Get.snackbar('Success', 'Logged out successfully');
  }
}
