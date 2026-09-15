import 'package:cms_project_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String fullName;
  final String jobTitle;
  final String company;
  final String email;
  final String phone;
  final String country;
  final String dateCreated;

  const CardWidget({
    super.key,
    required this.fullName,
    required this.jobTitle,
    required this.company,
    required this.email,
    required this.phone,
    required this.country,
    required this.dateCreated,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> name = fullName.split(" ");
    final String firstLetter = name.isNotEmpty && name[0].isNotEmpty
        ? name[0][0].toUpperCase()
        : "";
    final String secondLetter = name.length > 1 && name[1].isNotEmpty
        ? name[1][0].toUpperCase()
        : "";
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        border: Border(left: BorderSide(color: AppColors.primaryRed, width: 5)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.borderLight,
                    border: Border.all(color: AppColors.borderLight),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: 32,
                  width: 32,
                  child: Center(
                    child: Text(
                      firstLetter + "" + secondLetter,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  company,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                    height: 1.0,
                    letterSpacing: 0.2,
                    color: AppColors.subtitle,
                  ),
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.primaryRed.withOpacity(0.1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 8,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: AppColors.primaryRed, size: 14),
                        SizedBox(width: 4),
                        Text(
                          "VIP",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w900,
                            fontSize: 11,
                            height: 1.0,
                            letterSpacing: 0.2,
                            color: AppColors.primaryRed,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              fullName,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 22,
                height: 1.1,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              jobTitle,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 13,
                height: 1.0,
                letterSpacing: 0.2,
                color: AppColors.subtitle,
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Expanded(child: Divider(color: Colors.black12)),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.email_outlined, color: AppColors.subtitle, size: 16),
                SizedBox(width: 8),
                Text(
                  email,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.0,
                    letterSpacing: 0.2,
                    color: AppColors.subtitle,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.local_phone_outlined,
                  color: AppColors.subtitle,
                  size: 16,
                ),
                SizedBox(width: 8),
                Text(
                  phone,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.0,
                    letterSpacing: 0.2,
                    color: AppColors.subtitle,
                  ),
                ),
                Spacer(),
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Colors.indigo,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "LinkedIn",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    height: 1.0,
                    letterSpacing: 0.2,
                    color: Colors.indigo,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColors.subtitle,
                  size: 16,
                ),
                SizedBox(width: 8),
                Text(
                  "San Francisco, USA",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.0,
                    letterSpacing: 0.2,
                    color: AppColors.subtitle,
                  ),
                ),
                Spacer(),
                Text(
                  dateCreated,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.0,
                    letterSpacing: 0.2,
                    color: AppColors.subtitle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
