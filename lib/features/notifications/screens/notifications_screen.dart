import 'package:cms_project_app/features/notifications/models/notification_item_model.dart';
import 'package:cms_project_app/features/notifications/widgets/notification_row.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int _selectedTabIndex = 0;

  final List<Map<String, dynamic>> _tabsData = const [
    {'label': 'All', 'count': 7},
    {'label': 'Follow-ups', 'count': 3},
    {'label': 'Team', 'count': 2},
    {'label': 'System', 'count': 2},
  ];

  final List<NotificationItemModel> _notifications = const [
    NotificationItemModel(
      title: 'Sarah Chen',
      description: "Follow-up reminder: haven't contacted in 14 days",
      time: '5 min ago',
      priority: PriorityLevel.high,
     
    ),
    NotificationItemModel(
      title: 'Omar Faris',
      description: 'shared a new card with you: David Osei,\nNorthline Group',
      time: '32 min ago',
      priority: PriorityLevel.medium,
    
      timeIcon: Icons.card_membership_rounded,
    ),
    NotificationItemModel(
      title: 'Priya Anand',
      description: 'Meeting scheduled tomorrow at 2:00 PM',
      time: '1 hr ago',
      priority: PriorityLevel.high,
      
      timeIcon: Icons.calendar_today_outlined,
    ),
    NotificationItemModel(
      title: 'System',
      subtitle: 'Weekly summary',
      description: 'Your weekly summary is ready — 12 new cards added this week',
      time: '3 hrs ago',
      priority: PriorityLevel.low,
      isSystemIcon: true,
      timeIcon: Icons.access_time_rounded,
    ),
    NotificationItemModel(
      title: 'Sofia Marino',
      description: 'edited the card for James Liu, Nexus Corp',
      time: '5 hrs ago',
      priority: PriorityLevel.low,
     
      isUnread: false,
      timeIcon: Icons.edit_outlined,
    ),
    NotificationItemModel(
      title: 'Mariam Haddad',
      description: 'Birthday tomorrow — send a personal note',
      time: '8 hrs ago',
      priority: PriorityLevel.medium,
    
      timeIcon: Icons.cake_outlined,
    ),
    NotificationItemModel(
      title: 'System',
      subtitle: 'Data backup',
      description: 'Automatic backup completed successfully',
      time: 'Yesterday',
      priority: PriorityLevel.low,
    
      timeIcon: Icons.access_time_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffF7F7F8),
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 52,
        leadingWidth: 95,
        shape: const Border(
          bottom: BorderSide(
            color: Color(0xFFE4E4E7),
            width: 0.8,
          ),
        ),
        leading: Center(
          child: InkWell(
            onTap: () => Navigator.pop(context),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.chevron_left_rounded,
                    size: 22,
                    color: Color(0xff71717A),
                  ),
                  SizedBox(width: 2),
                  Text(
                    'Back',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      height: 1.2,
                      color: Color(0xff71717A),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Notifications',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF18181B),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '6 unread',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        color: Color(0xFF9A9AA2),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text(
                      'Mark all as read',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFE30613),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Segmented Tabs
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F5),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE4E4E7), width: 0.8),
              ),
              child: Row(
                children: List.generate(_tabsData.length, (index) {
                  final isSelected = _selectedTabIndex == index;
                  final item = _tabsData[index];

                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTabIndex = index),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.06),
                                    blurRadius: 6,
                                    offset: const Offset(0, 2),
                                  ),
                                ]
                              : null,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              item['label'],
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                                color: isSelected
                                    ? const Color(0xFF18181B)
                                    : const Color(0xFF71717A),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${item['count']}',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? const Color(0xFFE30613)
                                    : const Color(0xFFA1A1AA),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // List
          Expanded(
            child: ListView.separated(
              itemCount: _notifications.length,
              padding: const EdgeInsets.symmetric(vertical: 4),
              separatorBuilder: (context, index) => const Divider(
                color: Color(0xFFF1F5F9),
                thickness: 1,
                height: 1,
              ),
              itemBuilder: (context, index) {
                return NotificationRow(item: _notifications[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}