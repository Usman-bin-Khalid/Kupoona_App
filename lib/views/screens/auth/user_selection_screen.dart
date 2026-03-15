import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';
import '../../widgets/custom_button.dart';
import 'login_screen.dart';

class UserSelectionScreen extends StatefulWidget {
  const UserSelectionScreen({super.key});

  @override
  State<UserSelectionScreen> createState() => _UserSelectionScreenState();
}

class _UserSelectionScreenState extends State<UserSelectionScreen> {
  bool isCustomerSelected = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Center(
                child: Image.asset(
                  AppConstants.logo,
                  height: 40,
                  errorBuilder: (context, error, stackTrace) => Text(
                    'Kuponna',
                    style: AppTextStyles.poppinsBold(
                      fontSize: 24,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Text(
                'How would you like to use\nKuponna',
                textAlign: TextAlign.center,
                style: AppTextStyles.poppinsBold(
                  fontSize: 20,
                  color: isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: _buildSelectionCard(
                      title: 'Customer',
                      description:
                          'I want to discover great deals and redeem coupons for food, travel, and more.',
                      iconPath: AppConstants.customerIcon,
                      isSelected: isCustomerSelected,
                      onTap: () => setState(() => isCustomerSelected = true),
                      isDark: isDark,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildSelectionCard(
                      title: 'Merchant',
                      description:
                          'I want to list my deals and grow sales through group discounts.',
                      iconPath: AppConstants.merchantIcon,
                      isSelected: !isCustomerSelected,
                      onTap: () => setState(() => isCustomerSelected = false),
                      isDark: isDark,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectionCard({
    required String title,
    required String description,
    required String iconPath,
    required bool isSelected,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 240,
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : (isDark ? Colors.transparent : AppColors.border),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                iconPath,
                height: 80,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.person,
                  size: 80,
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: AppTextStyles.poppinsBold(
                fontSize: 16,
                color: isSelected
                    ? AppColors.primary
                    : (isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: AppTextStyles.interRegular(
                fontSize: 10,
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
