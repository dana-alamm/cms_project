import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isDestructive;
  final bool showArrow;

  const ProfileMenuItem({
    super.key, 
    required this.icon, 
    required this.title, 
    required this.onTap, 
   this.isDestructive=false, 
   this.showArrow=true
   });

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        isDestructive ? const Color(0xFFE30613) : const Color(0xFF18181B);
    final iconBgColor =
        isDestructive ? const Color(0xFFFFEAEA) : const Color(0xFFF4F4F5);
    return  InkWell(
   onTap: onTap,
   borderRadius: BorderRadius.circular(12),
   child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: [
        Container(
          width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: primaryColor, size: 20),
        ),
        const SizedBox(width: 14,),
        Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
            ),
            if (showArrow)
              const Icon(
                Icons.chevron_right_rounded,
                color: Color(0xFFCBD5E1),
                size: 20,
              ),
      ],
    ),
   ),
    );
  }
}