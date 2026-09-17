import 'package:cms_project_app/core/theme/app_colors.dart';
import 'package:cms_project_app/core/widgets/custom_app_bar.dart';
import 'package:cms_project_app/core/widgets/primary_button.dart';
import 'package:cms_project_app/features/contacts/screens/widgets/add_contact_field.dart';
import 'package:cms_project_app/features/contacts/screens/widgets/status_chips.dart';
import 'package:flutter/material.dart';

class AddContact extends StatelessWidget {
  const AddContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F8),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            children: [
              CustomAppBar(),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Color(0xFFECECEE),
                            width: 1.5,
                          ),
                        ),

                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(14),
                                      child: Icon(
                                        Icons.person_outline,
                                        size: 26,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "New Contact",
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 22,
                                      height: 1.1,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(color: Colors.grey.shade300),
                              SizedBox(height: 16),
                              AddContactField(
                                isName: true,
                                title: "FULL NAME",
                                hint: "Ahmad AL Zoubie",
                              ),
                              SizedBox(height: 16),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AddContactField(
                                          title: "JOB TITLE",
                                          hint: "job title",
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AddContactField(
                                          title: "COMPANY",
                                          hint: "company",
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 16),
                              AddContactField(
                                title: "EMAIL",
                                hint: "ahmad@company.com",
                              ),
                              SizedBox(height: 16),
                              AddContactField(
                                title: "PHONE",
                                hint: "+962 7x xxx xxxx",
                              ),
                              SizedBox(height: 16),
                              AddContactField(
                                title: "LINKEDIN URL",
                                hint: "linkedin.com/in/username",
                              ),
                              SizedBox(height: 16),
                              Text(
                                "STATUS",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                  height: 1.0,
                                  letterSpacing: 0.2,
                                  color: AppColors.subtitle,
                                ),
                              ),
                              SizedBox(height: 8),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    StatusChips(title: "Prospect"),
                                    SizedBox(width: 4),
                                    StatusChips(title: "Client"),
                                    SizedBox(width: 4),
                                    StatusChips(title: "VIP"),
                                    SizedBox(width: 4),
                                    StatusChips(title: "At Risk"),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                "NOTES",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 12,
                                  height: 1.0,
                                  letterSpacing: 0.2,
                                  color: AppColors.subtitle,
                                ),
                              ),
                              SizedBox(height: 8),
                              TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                  hintText:
                                      "How did you meet? Key context for future follow-ups...",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFECECEE),
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0xFFECECEE),
                                      width: 1.8,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                              SizedBox(height: 24),
                              Row(
                                children: [
                                  Expanded(
                                    child: OutlinedButton(
                                      onPressed: () {},
                                      style: OutlinedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 16,
                                        ),
                                        side: const BorderSide(
                                          color: Color(0xFFD1D5DB),
                                          width: 1.5,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        "Clear",
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Color(0xFF4B5563),
                                        ),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 16),

                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.primaryRed
                                                .withOpacity(0.3),
                                            blurRadius: 15,
                                            offset: const Offset(0, 6),
                                          ),
                                        ],
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.primaryRed,
                                          elevation: 0,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 16,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          "Save Contact",
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
