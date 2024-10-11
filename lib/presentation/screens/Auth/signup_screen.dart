import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/constants/constants.dart';
import '../../../services/constants/responsive.dart';
import '../../widgets/my_textFormField.dart';
import '../../widgets/my_text_wiget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController signUpController = Get.put(SignUpController());
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  TextEditingController userConfirmPasswordController = TextEditingController();
  TextEditingController userAddressController = TextEditingController();
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
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: MyText(
                              text: 'Welcome',
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                              color: black,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: MyText(
                              text:
                                  "Lets's get started by filling out of the form below",
                              color: grey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //name
                    Obx(
                      () => CustomTextFormField(
                        controller: userNameController,
                        hintText: 'Name',
                        labelText: 'Name',
                        errorText: signUpController.nameError.value.isNotEmpty
                            ? signUpController.nameError.value
                            : null,
                        onChanged: (value) {
                          signUpController.name.value = value;
                          signUpController.validateName;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //email
                    Obx(
                      () => CustomTextFormField(
                        controller: userEmailController,
                        hintText: 'Enter Eamil',
                        labelText: 'Enter Eamil',
                        errorText: signUpController.emailError.value.isNotEmpty
                            ? signUpController.emailError.value
                            : null,
                        onChanged: (value) {
                          signUpController.email.value = value;
                          signUpController.validateEmail;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //phone number
                    Obx(
                      () => CustomTextFormField(
                        maxLength: 10,
                        controller: userPhoneController,
                        hintText: 'phone',
                        labelText: 'Phone Number',
                        errorText: signUpController.phoneError.value.isNotEmpty
                            ? signUpController.phoneError.value
                            : null,
                        onChanged: (value) {
                          signUpController.phone.value = value;
                          signUpController.validatePhone;
                        },
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //password
                    Obx(
                      () => CustomTextFormField(
                        obscureText: !signUpController.isPasswordVisible.value,
                        controller: userPasswordController,
                        hintText: 'Password',
                        labelText: 'Password',
                        errorText:
                            signUpController.passwordError.value.isNotEmpty
                                ? signUpController.passwordError.value
                                : null,
                        suffixIcon: IconButton(
                          icon: Icon(signUpController.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            signUpController.togglePasswordVisibility();
                          },
                        ),
                        onChanged: (value) {
                          signUpController.password.value =
                              value; // Update the password observable
                          signUpController
                              .validatePassword(value); // Validate the password
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //confirm password
                    Obx(
                      () => CustomTextFormField(
                        obscureText:
                            !signUpController.isConfirmPasswordVisible.value,
                        controller: userConfirmPasswordController,
                        hintText: 'Confirm Password',
                        labelText: 'Confirm Password',
                        errorText: signUpController
                                .confirmPasswordError.value.isNotEmpty
                            ? signUpController.confirmPasswordError.value
                            : null,
                        suffixIcon: IconButton(
                          icon: Icon(
                              signUpController.isConfirmPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                          onPressed: () {
                            signUpController.toggleConfirmPasswordVisibility();
                          },
                        ),
                        onChanged: (value) {
                          signUpController.confirmPassword.value =
                              value; // Update confirm password
                          signUpController.validateConfirmPassword(
                              value); // Validate confirm password
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    //signup button
                    ElevatedButton(
                      onPressed: () {
                        try {
                          signUpController
                              .validateName(signUpController.name.value);
                          signUpController
                              .validateEmail(signUpController.email.value);
                          signUpController
                              .validatePhone(signUpController.phone.value);
                          signUpController.validatePassword(
                              signUpController.password.value);
                          signUpController.validateConfirmPassword(
                              signUpController.confirmPassword.value);

                          if (signUpController.nameError.value.isEmpty &&
                              signUpController.emailError.value.isEmpty &&
                              signUpController.phoneError.value.isEmpty &&
                              signUpController.passwordError.value.isEmpty &&
                              signUpController
                                  .confirmPasswordError.value.isEmpty) {
                            signUpController.signUpUser(
                              signUpController.name.value.trim(),
                              signUpController.email.value.trim(),
                              signUpController.phone.value.trim(),
                              userAddressController.text.trim(),
                              signUpController.password.value.trim(),
                            );

                            userNameController.clear();
                            userEmailController.clear();
                            userPhoneController.clear();
                            userAddressController.clear();
                            userPasswordController.clear();
                            userConfirmPasswordController.clear();

                            Get.snackbar(
                              'Successfully Registered',
                              '${signUpController.name.value} - Welcome to VAVFOODS!',
                              backgroundColor: green,
                              colorText: white,
                            );

                            // Get.toNamed(AppRoutes.mainScreen);
                          }
                        } catch (e) {
                          print('Error in the signup screen $e');
                          Get.snackbar(
                            'Error',
                            'Error in the signup screen: $e',
                            backgroundColor: red,
                            colorText: white,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        backgroundColor: greencolor,
                      ),
                      child: MyText(
                        text: 'Create Account',
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
