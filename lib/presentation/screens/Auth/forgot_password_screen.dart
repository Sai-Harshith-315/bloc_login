import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/constants/constants.dart';
import '../../../services/constants/responsive.dart';
import '../../widgets/my_app_bar.dart';
import '../../widgets/my_textFormField.dart';
import '../../widgets/my_text_wiget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController userEmailController = TextEditingController();
// init
  /*  final ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController()); */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Forgot Password'),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyText(text: 'Enter Your Mail For Reset your passsword'),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    controller: userEmailController,
                    hintText: 'Enter Eamil',
                    labelText: 'Email',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      backgroundColor: greencolor,
                    ),
                    onPressed: () {
                      final String userEmail = userEmailController.text.trim();

                      if (userEmail.isNotEmpty) {
                        /* forgotPasswordController.forgotPassword(userEmail);
                        userEmailController.clear();
                        Get.to(() => WelcomeScreen()); */
                        Get.snackbar('Notifaction sent', '$userEmail');
                      } else {
                        Get.snackbar('Error', 'Please Enter Your Email');
                      }
                    },
                    child: MyText(
                      text: 'Send',
                      color: white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
