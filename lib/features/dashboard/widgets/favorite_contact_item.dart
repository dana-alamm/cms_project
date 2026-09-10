
import 'package:flutter/material.dart';

class FavoriteContactItem extends StatelessWidget {
  final String name;
  final String role;
  final String company;
  final String lastActivity;
  final VoidCallback onCall;
  final VoidCallback onEmail;

  const FavoriteContactItem({
    super.key,
    required this.name,
    required this.role,
    required this.company,
    required this.lastActivity,
    required this.onCall,
    required this.onEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              height: 1.2,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            role,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 11,
              height: 1.2,
              color: Color(0xff71717A),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            company,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 11,
              height: 1.2,
              color: Color(0xff9A9AA2),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Last: $lastActivity',
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 11,
              height: 1.2,
              color: Color(0xffC4C4CB),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _buildActionButton(
                  icon: Icons.call_outlined,
                  label: 'Call',
                  onTap: onCall,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildActionButton(
                  icon: Icons.mail_outline_rounded,
                  label: 'Email',
                  onTap: onEmail,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 14, color: const Color(0xff3F3F46)),
            const SizedBox(width: 4),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 11,
                height: 1,
                color: Color(0xff3F3F46),
              ),
            ),
          ],
        ),
      ),
    );
  }
}