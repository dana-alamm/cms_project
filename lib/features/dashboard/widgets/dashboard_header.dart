import 'package:cms_project_app/core/theme/app_colors.dart';
import 'package:cms_project_app/core/widgets/custom_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashboardHeader extends StatelessWidget {
  final String userName;
  final int intFollowUpsCount;

  const DashboardHeader({
    super.key,
    this.userName = 'Amira',
    this.intFollowUpsCount = 3,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppBar(),

        const SizedBox(height: 24),
        Text(
          DateFormat('EEEE, MMMM d, yyyy').format(DateTime.now()),
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: AppColors.subtitle,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'Dashboard',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 26,
            height: 1.1,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Good morning, $userName. You have $intFollowUpsCount follow-ups due this week.',
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: AppColors.subtitle,
          ),
        ),
      ],
    );
  }
}
