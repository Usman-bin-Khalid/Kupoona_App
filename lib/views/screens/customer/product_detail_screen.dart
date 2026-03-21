import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../widgets/custom_button.dart';
import 'checkout_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  final Map<String, String> deal;

  const ProductDetailScreen({super.key, required this.deal});

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
        title: Text("Product View", style: AppTextStyles.interBold(fontSize: 18)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(deal["name"] ?? "Sushi lunch combi", style: AppTextStyles.poppinsBold(fontSize: 22)),
                  Text("by Wakame Restaurant", style: AppTextStyles.interRegular(fontSize: 14, color: AppColors.primary)),
                  const SizedBox(height: 12),
                  _buildStatusBadge(),
                  const SizedBox(height: 16),
                  _buildDetailRow(Icons.location_on_outlined, "Lagos, Nigeria"),
                  _buildDetailRow(Icons.star_outline, "4/5 (12 reviews)"),
                  _buildDetailRow(Icons.category_outlined, "Xmas Package"),
                  _buildDetailRow(Icons.people_outline, "3 required"),
                  const SizedBox(height: 16),
                  Text(
                    "Sushi Lunch Comb - Great Discounted Offer",
                    style: AppTextStyles.interRegular(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.edit_outlined, size: 16, color: Colors.blue),
                      const SizedBox(width: 4),
                      Text("Write a review", style: AppTextStyles.interMedium(fontSize: 14, color: Colors.blue)),
                      const SizedBox(width: 20),
                      const Icon(Icons.upload_outlined, size: 16, color: Colors.blue),
                      const SizedBox(width: 4),
                      Text("Upload Photo", style: AppTextStyles.interMedium(fontSize: 14, color: Colors.blue)),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoBox(context, Icons.star, "Best Rated", Colors.orange),
                      _buildInfoBox(context, Icons.shopping_basket, "0 Total Sold", Colors.pink),
                      _buildInfoBox(context, Icons.remove_red_eye, "5 Views", Colors.blue),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text("Amenities", style: AppTextStyles.interBold(fontSize: 16)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _buildAmenityChip("Wrapping", true),
                      const SizedBox(width: 12),
                      _buildAmenityChip("Free Card", true),
                    ],
                  ),
                ],
              ),
            ),
            Image.asset(
              AppConstants.suchi, // Using sushi for now, user images seem to have specific Xmas theme though
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomButton(
                    text: "Join Deal",
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CheckoutScreen())),
                    borderRadius: 12,
                    height: 56,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Sushi Lunch Combo\nGreat Discounted Offer",
                    style: AppTextStyles.interBold(fontSize: 16),
                  ),
                  const SizedBox(height: 30),
                  _buildReviewsSection(isDark),
                  const SizedBox(height: 30),
                  Text("Location Map", style: AppTextStyles.interBold(fontSize: 16)),
                  const SizedBox(height: 12),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage(AppConstants.front), // Placeholder for map
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                        ),
                        child: Text("Open in Maps", style: AppTextStyles.interBold(fontSize: 12, color: Colors.blue)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildContactSection(isDark),
                  const SizedBox(height: 30),
                  Text("Explore near you (within 200km)", style: AppTextStyles.interBold(fontSize: 16)),
                  const SizedBox(height: 12),
                  _buildExploreChips(),
                  const SizedBox(height: 30),
                  _buildBottomProductCard(isDark),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.teal),
      ),
      child: Text("active", style: AppTextStyles.interBold(fontSize: 12, color: Colors.teal)),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey),
          const SizedBox(width: 8),
          Text(text, style: AppTextStyles.interRegular(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildInfoBox(BuildContext context, IconData icon, String text, Color color) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 4),
          Text(text, style: AppTextStyles.interBold(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildAmenityChip(String label, bool isAvailable) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Text(label, style: AppTextStyles.interMedium(fontSize: 12)),
          const SizedBox(width: 4),
          Icon(Icons.check_circle, size: 14, color: Colors.green[400]),
        ],
      ),
    );
  }

  Widget _buildReviewsSection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Reviews", style: AppTextStyles.interBold(fontSize: 16)),
            Row(
              children: [
                Text("All Reviews", style: AppTextStyles.interMedium(fontSize: 12)),
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const Icon(Icons.star_half, color: Colors.amber, size: 16),
                Text("(12 reviews)", style: AppTextStyles.interRegular(fontSize: 12)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blue[100]!),
          ),
          child: Column(
            children: [
              Text(
                "Purchase this deal to leave a review and share your experience",
                textAlign: TextAlign.center,
                style: AppTextStyles.interMedium(fontSize: 14, color: Colors.blue[800]),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text("No reviews yet. Be the first to review", style: AppTextStyles.interRegular(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _buildContactSection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Where to Redeem and Contact", style: AppTextStyles.interBold(fontSize: 16)),
        const SizedBox(height: 16),
        _buildContactRow(Icons.location_city, "Lagos", subtitle: "Coordinates: 6.453240, 3.123560"),
        _buildContactRow(Icons.language, "kuponna.com"),
        _buildContactRow(Icons.email_outlined, "c.kuponna@icloud.com"),
        _buildContactRow(Icons.phone_outlined, "+234 815 332 6781"),
      ],
    );
  }

  Widget _buildContactRow(IconData icon, String text, {String? subtitle}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: subtitle != null ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text, style: AppTextStyles.interMedium(fontSize: 14)),
              if (subtitle != null) Text(subtitle, style: AppTextStyles.interRegular(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExploreChips() {
    final List<String> categories = ["RESTAURANT DEAL", "FOODS", "CATEGORY", "FOODS", "VEGETABLE", "OPTTERNS", "XMAS PACKAGE", "FOODS", "VEGETABLES", "FOODS", "TESTSTAR", "CATEGORY", "GAMES & LEISURE", "GOODS"];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: categories.map((cat) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(cat, style: AppTextStyles.interBold(fontSize: 10, color: Colors.grey[600])),
      )).toList(),
    );
  }

  Widget _buildBottomProductCard(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(AppConstants.profile, width: double.infinity, height: 150, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Peter's Meal", style: AppTextStyles.interBold(fontSize: 14)),
                const SizedBox(height: 4),
                Text("Peter's Meal...", style: AppTextStyles.interRegular(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text("N1,000", style: AppTextStyles.interBold(fontSize: 14, color: AppColors.primary)),
                    const SizedBox(width: 8),
                    Text("N100,000", style: AppTextStyles.interRegular(fontSize: 12, decoration: TextDecoration.lineThrough)),
                    const Spacer(),
                    Text("-93.33%", style: AppTextStyles.interBold(fontSize: 12, color: Colors.blue)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
