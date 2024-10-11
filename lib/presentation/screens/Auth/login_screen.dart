import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/constants/constants.dart';
import '../../../services/constants/responsive.dart';
import '../../widgets/my_textFormField.dart';
import '../../widgets/my_text_wiget.dart';

import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SignInController signInController = Get.put(SignInController());
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
//init the controller
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: Responsive.isDesktop(context) ||
                        Responsive.isDesktopLarge(context)
                    ? MediaQuery.of(context).size.width * .32
                    : Responsive.isTablet(context)
                        ? MediaQuery.of(context).size.width * .5
                        : Responsive.isMobileLarge(context)
                            ? MediaQuery.of(context).size.width * .7
                            : MediaQuery.of(context).size.width * .9,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: MyText(
                          text: 'Welcome Back!',
                          fontSize: 30,
                          color: black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(
                      () => CustomTextFormField(
                        controller: userEmailController,
                        hintText: 'Email',
                        labelText: 'Enter Mail',
                        errorText: signInController.emailError.value.isNotEmpty
                            ? signInController.emailError.value
                            : null,
                        onChanged: (value) {
                          signInController.email.value = value;
                          signInController.validateEmail;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(
                      () => CustomTextFormField(
                        obscureText: !signInController.isPasswordVisible.value,
                        controller: userPasswordController,
                        hintText: 'Password',
                        labelText: 'Password',
                        errorText:
                            signInController.passwordError.value.isNotEmpty
                                ? signInController.passwordError.value
                                : null,
                        suffixIcon: IconButton(
                          icon: Icon(
                            signInController.isPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            signInController.togglePasswordVisibility();
                          },
                        ),
                        onChanged: (value) {
                          signInController.password.value =
                              value; // Update the password observable
                          signInController
                              .validatePassword(value); // Validate the password
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const ForgotPassword());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: MyText(
                            text: 'Forgot Password ?',
                            color: greencolor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          // Check if the fields have any errors already
                          if (signInController.emailError.value.isEmpty &&
                              signInController.passwordError.value.isEmpty &&
                              signInController.email.value.isNotEmpty &&
                              signInController.password.value.isNotEmpty) {
                            // Attempt login using the observables directly
                            bool loginSuccess =
                                await signInController.loginUser(
                              signInController.email.value.trim(),
                              signInController.password.value.trim(),
                            );

                            if (loginSuccess) {
                              // If login is successful, navigate to the main screen
                              // Get.to(() => const MainScreen());
                              /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainScreen())); */

                              // Get.toNamed(AppRoutes.mainScreen);
                              ;
                              Get.snackbar(
                                '${userEmailController.text} Login Successful',
                                'Welcome to VAVFoods HomeScreen',
                                backgroundColor: green,
                                colorText: white,
                              );
                            } else {
                              // Login failed
                              Get.snackbar(
                                'Login Failed',
                                'Please check your email and password.',
                                backgroundColor: red,
                                colorText: white,
                              );
                            }
                          } else {
                            // Show validation errors if fields are empty or errors are present
                            Get.snackbar(
                              'Error',
                              'Please check it the entered fields are not correct.',
                              backgroundColor: red,
                              colorText: white,
                            );
                          }
                        } catch (e) {
                          print("Error in the SignIn Screen $e");
                          Get.snackbar(
                            'Error',
                            'Error in Sign In Screen: $e',
                            colorText: white,
                            backgroundColor: red,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        backgroundColor: greencolor,
                      ),
                      child: MyText(
                        text: 'Login',
                        fontSize: Responsive.isDesktop(context) ||
                                Responsive.isDesktopLarge(context)
                            ? 16
                            : 14,
                        color: white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
