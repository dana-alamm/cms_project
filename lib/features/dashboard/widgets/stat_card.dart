import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String badgeText;
  final Color badgeTextColor;
  final Color badgeBgColor;
  final String value;
  final String title;
  const StatCard({
    super.key, 
    required this.icon, 
    required this.iconColor, 
    required this.iconBgColor, 
    required this.badgeText, 
    required this.badgeTextColor, 
    required this.badgeBgColor, 
    required this.value, 
    required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color:Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.03),
          blurRadius: 10,
          offset: Offset(0, 4),
        )
      ]
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(16),

              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 20,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: badgeBgColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  badgeText,
                  style: TextStyle(
                    color: badgeTextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
              ),
            ),
            const SizedBox(height: 4,),
            Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF64748B),
                ),
              ),

          ],
        )
      ],
    ),
    );
  }
}