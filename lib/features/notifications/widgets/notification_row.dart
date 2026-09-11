import 'package:cms_project_app/features/notifications/models/notification_item_model.dart';
import 'package:cms_project_app/features/notifications/widgets/priority_badge.dart';
import 'package:flutter/material.dart';

class NotificationRow extends StatelessWidget {
  final NotificationItemModel item;

  const NotificationRow({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFFFEAEA),
              shape: BoxShape.circle,
              border: item.isSystemIcon
                  ? Border.all(
                      color: const Color(0xFFE30613).withOpacity(0.2),
                      width: 1.2,
                    )
                  : null,
            ),
            alignment: Alignment.center,
            child: item.isSystemIcon
                ? const Icon(
                    Icons.security_rounded,
                    color: Color(0xFFE30613),
                    size: 22,
                  )
                : Text(
                    item.initials,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Color(0xFF18181B),
                    ),
                  ),
          ),

          const SizedBox(width: 14),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF18181B),
                      ),
                    ),
                    const SizedBox(width: 8),
                    PriorityBadge(priority: item.priority),
                  ],
                ),
                if (item.subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    item.subtitle!,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: Color(0xFF9A9AA2),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
                const SizedBox(height: 4),
                Text(
                  item.description,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12.5,
                    color: Color(0xFF52525B),
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    if (item.timeIcon != null) ...[
                      Icon(
                        item.timeIcon,
                        size: 13,
                        color: const Color(0xFF9A9AA2),
                      ),
                      const SizedBox(width: 4),
                    ],
                    Text(
                      item.time,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 11,
                        color: Color(0xFF9A9AA2),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Unread Dot
          if (item.isUnread)
            Container(
              margin: const EdgeInsets.only(top: 6, left: 8),
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xFFE30613),
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
