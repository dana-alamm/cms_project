import 'package:flutter/material.dart';

class RecentContactData {
  final String contact;
  final String initiatedBy;
  final String sector;

  const RecentContactData({
    required this.contact,
    required this.initiatedBy,
    required this.sector,
  });
}

class RecentContactsCard extends StatelessWidget {
  final VoidCallback? onSeeAll;

  const RecentContactsCard({
    super.key,
    this.onSeeAll,
  });

  static const List<RecentContactData> _contacts = [
    RecentContactData(
      contact: 'Sarah Chen',
      initiatedBy: 'John Smith',
      sector: 'Healthcare',
    ),
    RecentContactData(
      contact: 'David Osei',
      initiatedBy: 'Sarah Lee',
      sector: 'Finance',
    ),
    RecentContactData(
      contact: 'Priya Anand',
      initiatedBy: 'Mike Chen',
      sector: 'Technology',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header (Recent Contacts + See all)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Contacts',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0F172A),
                  ),
                ),
                InkWell(
                  onTap: onSeeAll ?? () {},
                  borderRadius: BorderRadius.circular(6),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'See all',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFE30613),
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 14,
                          color: Color(0xFFE30613),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 2. Table Column Headers
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            color: const Color(0xFFF8FAFC),
            child: Row(
              children: const [
                Expanded(
                  flex: 4,
                  child: Text(
                    'Contact',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    'Initiated By',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Sector',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 3. Table Rows
          ListView.separated(
            itemCount: _contacts.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => const Divider(
              color: Color(0xFFF1F5F9),
              thickness: 1,
              height: 1,
            ),
            itemBuilder: (context, index) {
              final item = _contacts[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    // Contact (Bold + Underline)
                    Expanded(
                      flex: 4,
                      child: Text(
                        item.contact,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0F172A),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    // Initiated By
                    Expanded(
                      flex: 4,
                      child: Text(
                        item.initiatedBy,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ),
                    // Sector
                    Expanded(
                      flex: 3,
                      child: Text(
                        item.sector,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}