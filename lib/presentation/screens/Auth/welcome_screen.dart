import 'package:flutter/material.dart';
import '../../../services/constants/constants.dart';
import '../../widgets/my_text_wiget.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),
              // Welcome Text
              MyText(
                text: 'Farm2Kitchen',
                color: black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              MyText(
                text: 'Fresh Organic Produce at Your Doorstep',
                color: black,
                fontSize: 18,
              ),
              const SizedBox(height: 30),

              Container(
                child: TabBar(
                  indicator: BoxDecoration(
                    // color: white,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelColor: greencolor,
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelColor: black,
                  tabs: const [
                    Tab(
                      text: 'Login',
                    ),
                    Tab(text: 'Signup'),
                  ],
                ),
              ),

              // Expanded TabBarView to show content
              const Expanded(
                child: TabBarView(
                  children: [
                    LoginScreen(),
                    SignUpScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
