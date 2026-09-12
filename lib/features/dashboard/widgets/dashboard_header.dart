import 'package:cms_project_app/core/theme/app_colors.dart';
import 'package:cms_project_app/features/auth/controller/auth_provider.dart';
import 'package:cms_project_app/features/notifications/screens/notifications_screen.dart';
import 'package:cms_project_app/features/profile/widgets/profile_menu_sheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DashboardHeader extends StatelessWidget {
  final String userName;
  final int intFollowUpsCount;
  const DashboardHeader({
    super.key,
    this.userName = 'Amira',
    this.intFollowUpsCount = 3,
  });
   String _getInitials(String name){
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2 && parts[0].isNotEmpty && parts[1].isNotEmpty) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    if (parts.isNotEmpty && parts[0].isNotEmpty) {
      return parts[0][0].toUpperCase();
    }
    return 'U';
   }

  void _showProfileDropdown(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Dismiss',
    barrierColor: Colors.black.withOpacity(0.15), 
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (context, anim1, anim2) {
      return Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 100, right: 16), 
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.76,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: ProfileMenuSheet(),
              ),
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
     
      return Transform.scale(
        scale: anim1.value,
        alignment: Alignment.topRight,
        child: Opacity(
          opacity: anim1.value,
          child: child,
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthProvider>().currentUser;
     final String fullName = user?.fullName ?? 'User Name';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/estarta_logo.png',
                  height: 38,
                  fit: BoxFit.cover,
                ),

                SizedBox(height: 9),
                Text(
                  'Business Card Manager',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    height: 1.0,
                    letterSpacing: 0.2,
                    color: AppColors.subtitle,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                _buildHeaderIcon(
                  icon: Icons.calendar_today_outlined,
                  onTap: () {},
                ),
                const SizedBox(width: 8),
                _buildNotificationIcon(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationsScreen(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () =>
                   _showProfileDropdown(context),
                  
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1E293B),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                     // 'AM',
                     _getInitials(fullName),
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          //'Monday,July 7, 2026 ',
          DateFormat('EEEE, MMMM d , yyyy').format(DateTime.now()),
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: AppColors.subtitle,
          ),
        ),
        const SizedBox(height: 5),
        Text(
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

  Widget _buildHeaderIcon({
    required IconData icon,
    required VoidCallback onTap,
    Color iconColor = AppColors.iconColor,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Icon(icon, size: 18, color: iconColor),
      ),
    );
  }

  Widget _buildNotificationIcon({required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Icon(
              Icons.notifications_none_outlined,
              size: 20,
              color: Color(0xFF334155),
            ),
            Positioned(
              top: 8,
              right: 9,
              child: Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFFE11D48),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
