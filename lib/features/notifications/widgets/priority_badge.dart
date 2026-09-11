import 'package:cms_project_app/features/notifications/models/notification_item_model.dart';
import 'package:flutter/material.dart';

class PriorityBadge extends StatelessWidget {
  final PriorityLevel priority;

  const PriorityBadge({super.key, required this.priority});

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;
    String label;

    switch (priority) {
      case PriorityLevel.high:
        bgColor = const Color(0xFFFFEAEA);
        textColor = const Color(0xFFE30613);
        label = 'HIGH';
        break;
      case PriorityLevel.medium:
        bgColor = const Color(0xFFFEF3C7);
        textColor = const Color(0xFFD97706);
        label = 'MEDIUM';
        break;
      case PriorityLevel.low:
        bgColor = const Color(0xFFF4F4F5);
        textColor = const Color(0xFF71717A);
        label = 'LOW';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 9,
          fontWeight: FontWeight.w700,
          color: textColor,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}