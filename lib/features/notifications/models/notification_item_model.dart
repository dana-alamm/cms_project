import 'package:flutter/material.dart';

enum PriorityLevel { high, medium, low }

class NotificationItemModel {
  final String title;
  final String? subtitle;
  final String description;
  final String time;
  final PriorityLevel priority;
  final bool isUnread;
  final String? explicitInitials;
  final bool isSystemIcon;
  final IconData? timeIcon;

  const NotificationItemModel({
    required this.title,
    this.subtitle,
    required this.description,
    required this.time,
    required this.priority,
    this.isUnread = true,
    this.explicitInitials,
    this.isSystemIcon = false,
    this.timeIcon,
  });

  String get initials {
    if (explicitInitials != null) return explicitInitials!;
    if (isSystemIcon) return '';

    final words = title.trim().split(RegExp(r'\s+'));
    if (words.length >= 2) {
      return '${words[0][0]}${words[1][0]}'.toUpperCase();
    } else if (words.isNotEmpty && words[0].isNotEmpty) {
      return words[0][0].toUpperCase();
    }
    return '';
  }
}
