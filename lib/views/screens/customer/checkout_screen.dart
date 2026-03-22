import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../widgets/custom_button.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _selectedOption = 0; // 0 for Delivery, 1 for Pickup

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Check Out", style: AppTextStyles.interBold(fontSize: 18)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductHeader(isDark),
              const SizedBox(height: 30),
              Text(
                "Choose Your Option",
                style: AppTextStyles.interBold(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                "Select how you'd like to receive your order",
                style: AppTextStyles.interRegular(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              _buildOptionCard(
                0,
                "Delivery",
                "We deliver within Lagos and Ogun Stat",
                Icons.local_shipping_outlined,
                isDark,
              ),
              const SizedBox(height: 16),
              _buildOptionCard(
                1,
                "Pickup / Arranged Deliver",
                "Hassan's Farm, 131 Farmiland Road, Ibeju Lekki",
                Icons.location_on_outlined,
                isDark,
              ),
              const SizedBox(height: 16),
              _buildDisabledOption(
                "Redemption Card (Gifts Unavailable)",
                Icons.card_giftcard,
                isDark,
              ),
              const SizedBox(height: 40),
              Text(
                "Order Summary",
                style: AppTextStyles.interBold(fontSize: 16),
              ),
              const SizedBox(height: 20),
              _buildSummaryRow("Deal Price Per Person", "N16,000.00"),
              _buildSummaryRow("Delivery Fee", "N0"),
              const Divider(height: 32),
              _buildSummaryRow("Total:", "N16,000", isTotal: true),
              const SizedBox(height: 12),
              Text(
                "Selected Option: ${_selectedOption == 0 ? 'Delivery' : 'Pickup'}",
                style: AppTextStyles.interRegular(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: "Process Payment",
                onPressed: () {},
                borderRadius: 12,
                height: 56,
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  "You'll be redirected to payment after clicking 'pay' (Join Deal)",
                  style: AppTextStyles.interRegular(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductHeader(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sushi lunch Combo",
                  style: AppTextStyles.interBold(fontSize: 18),
                ),
                Text(
                  "by wakame Restaurant",
                  style: AppTextStyles.interRegular(
                    fontSize: 14,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "Expired",
                style: AppTextStyles.interBold(fontSize: 10, color: Colors.red),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          "Latest women wear",
          style: AppTextStyles.interRegular(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.people_outline, size: 16, color: Colors.grey),
            const SizedBox(width: 4),
            Text(
              "0/1 Members",
              style: AppTextStyles.interRegular(fontSize: 12),
            ),
            const SizedBox(width: 16),
            const Icon(Icons.access_time, size: 16, color: Colors.grey),
            const SizedBox(width: 4),
            Text(
              "Deadline: 2/10/2026",
              style: AppTextStyles.interRegular(fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(
              Icons.account_balance_wallet_outlined,
              size: 16,
              color: Colors.grey,
            ),
            const SizedBox(width: 4),
            Text(
              "Base Price: N16,000.00",
              style: AppTextStyles.interRegular(fontSize: 12),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text("Progress:", style: AppTextStyles.interBold(fontSize: 12)),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: 0.0,
          backgroundColor: isDark ? Colors.white10 : Colors.grey[200],
          valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
        ),
        const SizedBox(height: 4),
        Text(
          "0.0% completion",
          style: AppTextStyles.interRegular(fontSize: 10, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildOptionCard(
    int index,
    String title,
    String subtitle,
    IconData icon,
    bool isDark,
  ) {
    bool isSelected = _selectedOption == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedOption = index),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : (isDark ? Colors.white10 : Colors.grey[200]!),
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary.withOpacity(0.1)
                    : (isDark ? Colors.white10 : Colors.grey[50]),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isSelected ? AppColors.primary : Colors.grey,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.interBold(fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: AppTextStyles.interRegular(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: AppColors.primary),
          ],
        ),
      ),
    );
  }

  Widget _buildDisabledOption(String title, IconData icon, bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? Colors.white10 : Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey.withOpacity(0.5), size: 24),
          const SizedBox(width: 16),
          Text(
            title,
            style: AppTextStyles.interMedium(
              fontSize: 14,
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isTotal
                ? AppTextStyles.interBold(fontSize: 16)
                : AppTextStyles.interRegular(fontSize: 14),
          ),
          Text(
            value,
            style: isTotal
                ? AppTextStyles.interBold(
                    fontSize: 18,
                    color: AppColors.primary,
                  )
                : AppTextStyles.interBold(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
