import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../widgets/custom_button.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _selectedOption = 'Delivery';

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.backgroundDark : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: isDark ? Colors.white : Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Check Out", style: AppTextStyles.interBold(fontSize: 18)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? AppColors.surfaceDark : Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sushi lunch Combo", style: AppTextStyles.interBold(fontSize: 16)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text("Expired", style: AppTextStyles.interBold(fontSize: 10, color: Colors.red)),
                      ),
                    ],
                  ),
                  Text("by Wakame Restaurant", style: AppTextStyles.interRegular(fontSize: 12, color: AppColors.primary)),
                  const SizedBox(height: 8),
                  Text("Latest women wear", style: AppTextStyles.interRegular(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoItem(Icons.people_outline, "0/1 Members"),
                      _buildInfoItem(Icons.access_time, "Deadline 3/10/2035"),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _buildInfoItem(Icons.attach_money, "Base Price N160,000.00"),
                  const SizedBox(height: 16),
                  Text("Progress:", style: AppTextStyles.interMedium(fontSize: 12)),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: 0.0,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("0.0% complet", style: AppTextStyles.interRegular(fontSize: 10, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text("Choose Your Option", style: AppTextStyles.interBold(fontSize: 16)),
            Text("Select how you'd like to receive your order", style: AppTextStyles.interRegular(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 16),
            _buildOptionCard(
              "Delivery",
              "We deliver within Lagos and Ogun Stat",
              Icons.local_shipping_outlined,
              isSelected: _selectedOption == 'Delivery',
              onTap: () => setState(() => _selectedOption = 'Delivery'),
            ),
            const SizedBox(height: 12),
            _buildOptionCard(
              "Pickup / Arranged Deliver",
              "House 2, Farm, 112 Farmland Road, Ikoja Lagos",
              Icons.location_on_outlined,
              isSelected: _selectedOption == 'Pickup',
              onTap: () => setState(() => _selectedOption = 'Pickup'),
            ),
            const SizedBox(height: 12),
             _buildOptionCard(
              "Redemption Card (Gifts (Unavailable))",
              "",
              Icons.card_giftcard_outlined,
              isSelected: false,
              isDisabled: true,
              onTap: () {},
            ),
            const SizedBox(height: 30),
            Text("Order Summary", style: AppTextStyles.interBold(fontSize: 16)),
            const SizedBox(height: 16),
            _buildSummaryRow("Deal Price Per Person", "N16,000.00"),
            _buildSummaryRow("Delivery Fee", "N0"),
            const Divider(),
            _buildSummaryRow("Total:", "N16,000.00", isTotal: true),
            const SizedBox(height: 8),
            Text("Selected Option: $_selectedOption", style: AppTextStyles.interMedium(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 30),
            CustomButton(
              text: "Deal Expired", // Matching image text even if it's a checkout
              onPressed: () {},
              color: Colors.red[400],
              borderRadius: 8,
              height: 48,
            ),
            const SizedBox(height: 12),
            Center(
              child: Text(
                "You'll be redirected to payment after clicking join Deal",
                textAlign: TextAlign.center,
                style: AppTextStyles.interRegular(fontSize: 10, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.grey),
        const SizedBox(width: 4),
        Text(text, style: AppTextStyles.interMedium(fontSize: 12)),
      ],
    );
  }

  Widget _buildOptionCard(String title, String subtitle, IconData icon, {required bool isSelected, bool isDisabled = false, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.05) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? Colors.blue : Colors.grey[300]!),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: isSelected ? Colors.blue : Colors.grey[100], shape: BoxShape.circle),
              child: Icon(icon, color: isSelected ? Colors.white : Colors.grey, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.interBold(fontSize: 14, color: isDisabled ? Colors.grey : Colors.black)),
                  if (subtitle.isNotEmpty) Text(subtitle, style: AppTextStyles.interRegular(fontSize: 10, color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: isTotal ? AppTextStyles.interBold(fontSize: 16) : AppTextStyles.interMedium(fontSize: 14)),
          Text(value, style: isTotal ? AppTextStyles.interBold(fontSize: 16, color: Colors.green) : AppTextStyles.interBold(fontSize: 14)),
        ],
      ),
    );
  }
}
