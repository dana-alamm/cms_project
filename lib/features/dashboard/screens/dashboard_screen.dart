import 'package:cms_project_app/core/theme/app_colors.dart';
import 'package:cms_project_app/core/widgets/custom_bottom_nav_bar.dart';
import 'package:cms_project_app/features/contacts/screens/contacts_screen.dart';
import 'package:cms_project_app/features/dashboard/widgets/contact_distribution_card.dart';
import 'package:cms_project_app/features/dashboard/widgets/dashboard_header.dart';
import 'package:cms_project_app/features/dashboard/widgets/favorite_contacts_card.dart';
import 'package:cms_project_app/features/dashboard/widgets/recent_contacts_card.dart';
import 'package:cms_project_app/features/dashboard/widgets/schedule_card.dart';
import 'package:cms_project_app/features/dashboard/widgets/stats_grid.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DashboardHeader(),
              const SizedBox(height: 20),
              const StatsGrid(),
              const SizedBox(height: 20),
              const ScheduleCard(),

              const SizedBox(height: 20),
              const ContactDistributionCard(),

              const SizedBox(height: 20),
              const FavoriteContactsCard(),

              const SizedBox(height: 20),
              const RecentContactsCard(),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(
      //   currentIndex: 0,
      //   onTap: (index) {
      //     if (index == 1) {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (_) => const ContactsScreen()),
      //       );
      //     }
      //   },
      // ),
    );
  }
}
