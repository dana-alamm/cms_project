import 'package:cms_project_app/core/theme/app_colors.dart';
import 'package:cms_project_app/features/profile/widgets/profile_menu_item.dart';
import 'package:cms_project_app/features/profile/widgets/profile_section_header.dart';
import 'package:flutter/material.dart';

class ProfileMenuSheet extends StatelessWidget {
  const ProfileMenuSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.black,
                child: Text(
                  'AM',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color:Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,

                  ),
                ),
              ),
              const SizedBox(width: 14,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Amira Malik',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      height: 1,
                      color: Colors.black
                    ),
                  ),
                  const SizedBox(height: 4,),
                  Text(
                    'amira@estarta.co',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color:AppColors.subtitle,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1,
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: Color(0xFFF4F4F5), thickness: 1),
          const SizedBox(height: 12),

          ProfileSectionHeader(title: 'ACCOUNT'),
          ProfileMenuItem(
            icon: Icons.access_time_rounded,
            title: 'History', 
            onTap: (){},
            ),
            ProfileMenuItem(
            icon: Icons.settings_outlined,
            title: 'Settings',
            onTap: () {},
          ),

          const SizedBox(height: 12),
          const Divider(color: Color(0xFFF4F4F5), thickness: 1),
          const SizedBox(height: 12),
          
          const ProfileSectionHeader(title: 'SUPPORT'),
          ProfileMenuItem(
            icon: Icons.help_outline_rounded,
            title: 'Help Center',
            onTap: () {},
          ),
          ProfileMenuItem(
            icon: Icons.description_outlined,
            title: 'Terms & Privacy',
            onTap: () {},
          ),

          const SizedBox(height: 12),
          const Divider(color: Color(0xFFF4F4F5), thickness: 1),
          const SizedBox(height: 12),


          ProfileMenuItem(
            icon: Icons.logout_rounded,
            title: 'Log Out',
            isDestructive: true,
            showArrow: false,
            onTap: () {
              
            },
          ),
        ],
      ),
    );
  }
}