import 'package:get/get.dart';
import '../../data/repositories/firebase_auth_repo.dart';
import '../../domain/repositories/auth_service_repo.dart';
import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthServiceRepo>(() => FirebaseAuthRepo());
    Get.lazyPut<AuthController>(
        () => AuthController(authServiceRepo: Get.find()));
  }
}
