import 'package:cms_project_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AuthScreenTemplate extends StatelessWidget {
  final Widget topContent;
  final Widget bottomContent;

  const AuthScreenTemplate({
    super.key,
    required this.topContent,
    required this.bottomContent,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.gradient),

        child: SafeArea(
          bottom: false,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                              vertical: 32.0,
                            ),
                            child: Center(child: topContent),
                          ),
                        ),

                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30),
                            ),
                          ),
                          padding: const EdgeInsets.only(
                            top: 32.0,
                            left: 24.0,
                            right: 24.0,
                            bottom: 24.0,
                          ),

                          child: SafeArea(top: false, child: bottomContent),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
