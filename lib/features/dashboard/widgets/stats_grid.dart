import 'package:cms_project_app/features/dashboard/widgets/stat_card.dart';
import 'package:flutter/material.dart';

class StatsGrid extends StatelessWidget {
  const StatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.15,
      children: const[
        StatCard(
          icon: Icons.contact_page_outlined,
          iconColor: Color(0xff16A34A), 
          iconBgColor: Color(0xFFECFDF5),
          badgeText: '+86', 
          badgeTextColor:  Color(0xff16A34A), 
          badgeBgColor: Color(0xFFECFDF5),
          value: '1,248', 
          title: 'Total Contacts',
          ),
          StatCard(
            icon: Icons.access_time_rounded, 
            iconColor: Color(0xffE30613), 
            iconBgColor: Color(0xFFFEF2F2),
            badgeText: '5 overdue', 
            badgeTextColor: Color(0xffE30613), 
            badgeBgColor:Color(0xFFFEF2F2), 
            value: '14', 
            title: 'Follow-ups Due',
            ),
            StatCard(
          icon: Icons.add,
          iconColor: Color(0xFF10B981),
          iconBgColor: Color(0xFFECFDF5),
          badgeText: '+18%',
          badgeTextColor: Color(0xFF10B981),
          badgeBgColor: Color(0xFFECFDF5),
          value: '86',
          title: 'New This Month',
        ),
        StatCard(
          icon: Icons.calendar_today_outlined,
          iconColor: Color(0xFF3B82F6),
          iconBgColor: Color(0xFFEFF6FF),
          badgeText: '2 today',
          badgeTextColor: Color(0xFF3B82F6),
          badgeBgColor: Color(0xFFEFF6FF),
          value: '7',
          title: 'Upcoming Meetings',
        ),
      ],
      );
  }
}