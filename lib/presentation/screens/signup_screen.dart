import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../bussiness/controllers/auth_controller.dart';

class SignUpScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            Obx(() => authController.isLoading.value
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      await authController.signUp(
                        emailController.text,
                        passwordController.text,
                      );
                    },
                    child: const Text('Sign Up'),
                  )),
          ],
        ),
      ),
    );
  }
}
