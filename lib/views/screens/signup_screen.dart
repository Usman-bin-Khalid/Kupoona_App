import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Navigator.pop(context)),
        title: Image.asset(
          AppConstants.logo,
          height: 30,
          errorBuilder: (context, error, stackTrace) => Text(
            'Kuponna',
            style: AppTextStyles.poppinsBold(
              fontSize: 20,
              color: AppColors.primary,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.star_outline, color: Colors.pinkAccent),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              'Sign Up 👋',
              style: AppTextStyles.poppinsBold(
                fontSize: 24,
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(height: 32),
            const CustomTextField(label: 'Name', hintText: 'Enter your name'),
            const SizedBox(height: 20),
            const CustomTextField(
              label: 'Email',
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: 'Password*',
              hintText: 'Create a password',
              isPassword: true,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.visibility_off_outlined),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Must be at least 8 characters.',
              style: AppTextStyles.interRegular(
                fontSize: 12,
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: 'Confirm Password*',
              hintText: 'Confirm password',
              isPassword: true,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.visibility_off_outlined),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Must be at least 8 characters.',
              style: AppTextStyles.interRegular(
                fontSize: 12,
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
            const SizedBox(height: 32),
            CustomButton(text: 'Continue', onPressed: () {}),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.g_mobiledata, size: 30),
                label: Text(
                  'Sign in with Google',
                  style: AppTextStyles.interBold(
                    fontSize: 16,
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: isDark ? AppColors.surfaceDark : AppColors.border,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: AppTextStyles.interRegular(
                    fontSize: 14,
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    'Sign in',
                    style: AppTextStyles.interBold(
                      fontSize: 14,
                      color: AppColors.primary,
                    ),
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
