import 'package:cms_project_app/features/dashboard/widgets/favorite_contact_item.dart';
import 'package:flutter/material.dart';

class FavoriteContactsCard extends StatelessWidget {
  const FavoriteContactsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(
                  Icons.star_rounded,
                  color: Color(0xffE30613),
                  size: 22,
                ),
                const SizedBox(width: 8,),
                Text(
                  'Favorite Contacts',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    height: 1,
                    color: Color(0xff18181B)
                  ),
                )
              ],
            ),
            ),
            const SizedBox(height: 16,),
            SizedBox(
            height: 146,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                FavoriteContactItem(
                  name: 'Sarah Chen',
                  role: 'VP Partnerships',
                  company: 'Northwind',
                  lastActivity: '2h ago',
                  onCall: () {},
                  onEmail: () {},
                ),
                const SizedBox(width: 14),
                FavoriteContactItem(
                  name: "James O'Connell",
                  role: 'Director of Ops',
                  company: 'Cedar Freight',
                  lastActivity: '4d ago',
                  onCall: () {},
                  onEmail: () {},
                ),
                const SizedBox(width: 14),
                FavoriteContactItem(
                  name: 'Alex Rivera',
                  role: 'Senior Consultant',
                  company: 'Apex Tech',
                  lastActivity: '1w ago',
                  onCall: () {},
                  onEmail: () {},
                ),
        ],
      ),

    ),
        ]
      )
    );
  }
}