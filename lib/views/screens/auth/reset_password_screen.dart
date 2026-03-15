import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import 'success_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  double _strength = 0;
  bool _isStrong = false;

  void _checkPasswordStrength(String password) {
    setState(() {
      if (password.isEmpty) {
        _strength = 0;
      } else if (password.length < 6) {
        _strength = 0.25;
      } else if (password.length < 8) {
        _strength = 0.5;
      } else {
        _strength = 1.0;
      }
      _isStrong = _strength == 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Navigator.pop(context)),
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
            Text(
              'Reset password',
              style: AppTextStyles.poppinsBold(
                fontSize: 24,
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Please type something you’ll remember',
              style: AppTextStyles.interRegular(
                fontSize: 14,
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
            const SizedBox(height: 32),
            CustomTextField(
              label: 'Password',
              hintText: 'Must be 8 characters',
              isPassword: true,
              controller: _passwordController,
              onChanged: _checkPasswordStrength,
            ),
            if (_passwordController.text.isNotEmpty) ...[
              const SizedBox(height: 12),
              Row(
                children: List.generate(4, (index) {
                  return Expanded(
                    child: Container(
                      height: 4,
                      margin: EdgeInsets.only(right: index == 3 ? 0 : 4),
                      decoration: BoxDecoration(
                        color: _strength > (index / 4)
                            ? AppColors.success
                            : AppColors.border,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Password strength: ${_isStrong ? "Strong!" : "Weak"}',
                    style: AppTextStyles.interMedium(
                      fontSize: 12,
                      color: isDark
                          ? AppColors.textSecondaryDark
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                  if (_isStrong) ...[
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.check_box,
                      color: AppColors.success,
                      size: 16,
                    ),
                  ],
                ],
              ),
            ],
            const SizedBox(height: 24),
            CustomTextField(
              label: 'Confirm New Password',
              hintText: 'Repeat Password',
              isPassword: true,
              controller: _confirmPasswordController,
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'Reset Password',
              color: _isStrong ? AppColors.primary : AppColors.primaryInactive,
              onPressed: () {
                if (_isStrong &&
                    _passwordController.text ==
                        _confirmPasswordController.text) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuccessScreen(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
