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
          icon: Icon(Icons.arrow_back_ios, color: isDark ? Colors.white : Colors.black, size: 20),
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
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(deal["name"] ?? "Sushi Lunch Comb", style: AppTextStyles.interBold(fontSize: 22)),
                            Text("by Wakame Restaurant", style: AppTextStyles.interRegular(fontSize: 14, color: AppColors.primary)),
                          ],
                        ),
                      ),
                       Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE0F2F1), // Very light teal
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.teal, width: 0.5),
                        ),
                        child: Text("active", style: AppTextStyles.interBold(fontSize: 12, color: Colors.teal)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildDetailRow(Icons.location_on, "Lagos, Nigeria"),
                  _buildDetailRow(Icons.star, "4/5 (12 reviews)"),
                  _buildDetailRow(Icons.category, "Xmas Package"),
                  _buildDetailRow(Icons.people, "2 required"),
                  const SizedBox(height: 16),
                  Text(
                    "Sushi Lunch Comb - Great Discounted Offer",
                    style: AppTextStyles.interRegular(fontSize: 14, color: isDark ? Colors.white70 : Colors.grey[700]),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.edit, size: 16, color: Colors.blue),
                      const SizedBox(width: 4),
                      Text("Write a review", style: AppTextStyles.interMedium(fontSize: 13, color: Colors.blue)),
                      const SizedBox(width: 24),
                      const Icon(Icons.upload, size: 16, color: Colors.blue),
                      const SizedBox(width: 4),
                      Text("Upload Photo", style: AppTextStyles.interMedium(fontSize: 13, color: Colors.blue)),
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
              deal["image"] ?? AppConstants.suchi,
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
                  Text("Location Ma", style: AppTextStyles.interBold(fontSize: 16)), // "Ma" as in image
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
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
                        ),
                        child: Text("Open in Maps", style: AppTextStyles.interBold(fontSize: 12, color: Colors.blue)),
                      ),
                    ),
                  ),
                   const SizedBox(height: 12),
                  Text("Location: Ibaju, Lagos State, Nigeria", style: AppTextStyles.interRegular(fontSize: 10, color: Colors.grey)),
                  Text("Coordinates: 6.907920, 3.321390", style: AppTextStyles.interRegular(fontSize: 10, color: Colors.grey)),
                  const SizedBox(height: 30),
                  _buildContactSection(isDark),
                  const SizedBox(height: 30),
                  Text("Explore near you (within 200km)", style: AppTextStyles.interBold(fontSize: 16)),
                  const SizedBox(height: 12),
                  _buildExploreChips(isDark),
                  const SizedBox(height: 30),
                  _buildBottomProductCard(isDark),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.primary),
          const SizedBox(width: 12),
          Text(text, style: AppTextStyles.interRegular(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildInfoBox(BuildContext context, IconData icon, String text, Color color) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isDark ? Colors.white10 : Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Text(text, style: AppTextStyles.interBold(fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildAmenityChip(String label, bool isAvailable) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Text(label, style: AppTextStyles.interRegular(fontSize: 12, color: Colors.black87)),
          const SizedBox(width: 8),
          const Icon(Icons.check_circle, size: 16, color: Colors.green),
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
             Row(
                children: [
                  Text("All Reviews  ", style: AppTextStyles.interBold(fontSize: 14)),
                  Row(
                    children: List.generate(5, (i) => Icon(
                      i < 4 ? Icons.star : Icons.star_half,
                      color: Colors.amber,
                      size: 14,
                    )),
                  ),
                  Text(" (12 reviews)", style: AppTextStyles.interRegular(fontSize: 12, color: Colors.grey)),
                ],
              ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFE3F2FD), // Light blue
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            "Purchase this deal to leave a review and share your experience",
            textAlign: TextAlign.center,
            style: AppTextStyles.interMedium(fontSize: 13, color: Colors.blue[800]),
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
        const SizedBox(height: 20),
        _buildContactRow(Icons.location_on, "Lagos", subtitle: "Coordinates: 6.453240, 3.123560"),
        _buildContactRow(Icons.language, "kuponna.com"),
        _buildContactRow(Icons.email, "c.kuponna@icloud.com"),
        _buildContactRow(Icons.phone, "+234 815 332 6781"),
      ],
    );
  }

  Widget _buildContactRow(IconData icon, String text, {String? subtitle}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: subtitle != null ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: AppColors.primary),
          const SizedBox(width: 16),
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

  Widget _buildExploreChips(bool isDark) {
    final List<String> categories = [
      "RESTAURANT DEAL", "FOODS", "CATEGORY", "FOODS", "VEGETABLE",
      "OPTTERNS", "XMAS PACKAGE", "FOODS", "VEGETABLES", "FOODS",
      "TESTSTAR", "CATEGORY", "GAMES & LEISURE", "GOODS"
    ];
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: categories.map((cat) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isDark ? Colors.white10 : Colors.white,
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
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 15, offset: const Offset(0, 5))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(AppConstants.front, width: double.infinity, height: 180, fit: BoxFit.cover),
              ),
              const Positioned(
                top: 12,
                right: 12,
                child: Icon(Icons.favorite_border, color: Colors.white),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Peter's Meal", style: AppTextStyles.interBold(fontSize: 16)),
                Text("Peter's Meal...", style: AppTextStyles.interRegular(fontSize: 13, color: Colors.grey)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text("N1,000", style: AppTextStyles.interBold(fontSize: 16, color: AppColors.primary)),
                    const SizedBox(width: 8),
                    Text("N100,000", style: AppTextStyles.interRegular(fontSize: 13, color: Colors.grey, decoration: TextDecoration.lineThrough)),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
                      child: Text("-93.33%", style: AppTextStyles.interBold(fontSize: 12, color: Colors.blue)),
                    ),
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
