import 'package:flutter/material.dart';
import 'package:kuponna_app/views/screens/auth/success_screen.dart';
import 'verification_screen.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  double _strength = 0;
  bool _isStrong = false;
  bool _formFilled = false;

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
      _checkForm();
    });
  }

  void _checkForm() {
    setState(() {
      _formFilled =
          _nameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _isStrong &&
          _passwordController.text == _confirmPasswordController.text;
    });
  }

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
            CustomTextField(
              label: 'Name',
              hintText: 'Enter your name',
              controller: _nameController,
              onChanged: (_) => _checkForm(),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: 'Email',
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              onChanged: (_) => _checkForm(),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: 'Password*',
              hintText: 'Create a password',
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
            const SizedBox(height: 20),
            CustomTextField(
              label: 'Confirm Password*',
              hintText: 'Confirm password',
              isPassword: true,
              controller: _confirmPasswordController,
              onChanged: (_) => _checkForm(),
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'Continue',
              color: _formFilled
                  ? AppColors.primary
                  : AppColors.primaryInactive,
              onPressed: () {
                if (_formFilled) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          VerificationScreen(email: _emailController.text),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: Image.asset(AppConstants.googleIcon, height: 24),
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
                    borderRadius: BorderRadius.circular(50),
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
