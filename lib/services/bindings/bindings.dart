import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../controllers/signup_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Register your controllers here
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
