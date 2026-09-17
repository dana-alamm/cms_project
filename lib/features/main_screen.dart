import 'package:cms_project_app/core/widgets/custom_bottom_nav_bar.dart';
import 'package:cms_project_app/features/analytics/analytics_screen.dart';
import 'package:cms_project_app/features/contacts/screens/add_contact.dart';
import 'package:cms_project_app/features/contacts/screens/contacts_screen.dart';
import 'package:cms_project_app/features/dashboard/screens/dashboard_screen.dart';
import 'package:cms_project_app/features/follow%20up/follow_ups_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const DashboardScreen(),
    const ContactsScreen(),
    const AddContact(),
    const FollowUpsScreen(),
    const AnalyticsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
