import 'package:cms_project_app/core/theme/app_colors.dart';
import 'package:cms_project_app/features/notifications/screens/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashboardHeader extends StatelessWidget {
  final String userName;
  final int  intFollowUpsCount;
  const DashboardHeader({
    super.key, 
     this.userName='Amira', 
     this.intFollowUpsCount=3,
    });

  @override
  Widget build(BuildContext context) {
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
                  Image.asset('assets/images/estarta_logo.png',
                  height: 38,
                  fit: BoxFit.cover,),

                  SizedBox(height: 9,),
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
                  )
                ],
              ),
              Row(
                children: [
                 _buildHeaderIcon(
                  icon: Icons.calendar_today_outlined, 
                  onTap: (){},
                  
                  ),
                  const SizedBox(width: 8,),
                   _buildNotificationIcon(
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder:(context)=> NotificationsScreen())),
                    ),
                    const SizedBox(width: 8,),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xFF1E293B),
                    shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'AM',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.white
                        ),
                      ),
                    )
                ],
              )
            ],
          ),
          const SizedBox(height: 24,),
          Text(
            //'Monday,July 7, 2026 ',
           DateFormat('EEEE, MMMM d , yyyy').format(DateTime.now()),
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color:AppColors.subtitle,

            ),
          ),
          const SizedBox(height: 5,),
          Text(
            'Dashboard',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: 26,
              height: 1.1,
              color:Colors.black,
            ),
          ),
          const SizedBox(height: 5,),
         
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
  Widget _buildHeaderIcon({required IconData icon,required VoidCallback onTap,  Color iconColor=AppColors.iconColor}){
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
      child: Icon(
        icon,
        size: 18,
        color: iconColor,
      ),
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
            const Icon(Icons.notifications_none_outlined, size: 20, color: Color(0xFF334155)),
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