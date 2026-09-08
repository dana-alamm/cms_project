import 'package:cms_project_app/core/theme/app_colors.dart';
import 'package:cms_project_app/features/dashboard/widgets/dashboard_header.dart';
import 'package:cms_project_app/features/dashboard/widgets/stats_grid.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor:AppColors.bgColor ,
  body: SafeArea(
    child: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DashboardHeader(),
          const SizedBox(height: 20,),
          const StatsGrid(),
        ],
      ),
    )
    ),
    );
  }
}