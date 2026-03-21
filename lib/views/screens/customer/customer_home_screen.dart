import 'package:flutter/material.dart';
import 'package:kuponna_app/views/screens/customer/checkout_screen.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_search_bar.dart';
import '../../widgets/category_chip.dart';
import '../../widgets/filter_bottom_sheet.dart';
import 'product_detail_screen.dart';
import 'notifications_screen.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _currentIndex = 0;
  String _selectedCategory = "ALL";
  bool _showAllBestOffers = false;

  final Map<String, List<Map<String, String>>> _categoryDeals = {
    "ALL": [
      {"name": "Confectionery and Jam", "image": AppConstants.roll},
      {"name": "Fresh Smart Bread", "image": AppConstants.roll},
      {"name": "Fresh Banana", "image": AppConstants.banana},
      {"name": "Fresh Bottle", "image": AppConstants.rose},
    ],
    "CONFECTIONERY": [
      {"name": "Confectionery and Jam", "image": AppConstants.roll},
    ],
    "BREAD": [
      {"name": "Fresh Smart Bread", "image": AppConstants.roll},
    ],
    "MEAT": [], // No meat in constants yet
  };

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, isDark),
            const SizedBox(height: 35),
            _buildQuickActions(isDark),
            const SizedBox(height: 24),
            _buildSectionHeader("Deals near you right now", showSeeMore: false),
            const SizedBox(height: 16),
            _buildNearYouDeals(isDark),
            const SizedBox(height: 24),
            _buildSectionHeader(
              "Trending deals around you",
              showSeeMore: false,
            ),
            const SizedBox(height: 16),
            _buildCategories(isDark),
            const SizedBox(height: 16),
            _buildTrendingDeals(isDark),
            const SizedBox(height: 24),
            _buildSectionHeader(
              "Best Offer For You",
              showSeeMore: true,
              onSeeMore: () =>
                  setState(() => _showAllBestOffers = !_showAllBestOffers),
              seeMoreText: _showAllBestOffers ? "See less" : "See more",
            ),
            const SizedBox(height: 16),
            _buildBestOffers(isDark),
            const SizedBox(height: 24),
            _buildSectionHeader("Amazing Deals", showSeeMore: true),
            const SizedBox(height: 16),
            _buildAmazingDeals(isDark),
            const SizedBox(height: 24),
            _buildSectionHeader("Top Deals This Week", showSeeMore: true),
            const SizedBox(height: 16),
            _buildTopDealsThisWeek(isDark),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(isDark),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDark) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 250,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            image: DecorationImage(
              image: AssetImage(AppConstants.front),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0.1),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello, Daniel!",
                          style: AppTextStyles.poppinsBold(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Search deals near by you",
                          style: AppTextStyles.interRegular(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckoutScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const NotificationsScreen(),
                            ),
                          ),
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                              image: const DecorationImage(
                                image: AssetImage(AppConstants.profile),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -28,
          left: 20,
          right: 20,
          child: CustomSearchBar(
            hintText: "Search Deals",
            onChanged: (value) {},
            onTuneTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => const FilterBottomSheet(),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActions(bool isDark) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            _buildQuickActionButton(
              "FOOD DEALS",
              "Amazing Deals",
              const Color(0xFFF3E5F5), // Light purple
              const Color(0xFF9C27B0), // Purple
              Icons.cake,
              isDark,
            ),
            const SizedBox(width: 16),
            _buildQuickActionButton(
              "LIMITED GROUPS",
              "Best Deals",
              const Color(0xFFFFF3E0), // Light orange
              const Color(0xFFFF9800), // Orange
              Icons.bar_chart,
              isDark,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionButton(
    String title,
    String subtitle,
    Color bgColor,
    Color iconColor,
    IconData icon,
    bool isDark,
  ) {
    return Container(
      constraints: const BoxConstraints(minWidth: 154),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: isDark ? Colors.white10 : Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppTextStyles.interBold(
                    fontSize: 10,
                    color: iconColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: AppTextStyles.interRegular(
                    fontSize: 9,
                    color: isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(
    String title, {
    required bool showSeeMore,
    VoidCallback? onSeeMore,
    String? seeMoreText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.poppinsBold(fontSize: 18)),
          if (showSeeMore)
            GestureDetector(
              onTap: onSeeMore,
              child: Text(
                seeMoreText ?? "See more",
                style: AppTextStyles.interMedium(
                  fontSize: 14,
                  color: AppColors.primary,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNearYouDeals(bool isDark) {
    return SizedBox(
      height: 267,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20),
        itemCount: 3,
        itemBuilder: (context, index) {
          final deal = {
            "name": "Sushi lunch combi",
            "image": AppConstants.suchi,
          };
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetailScreen(deal: deal),
              ),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.66,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: isDark ? AppColors.surfaceDark : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Image.asset(
                          AppConstants.suchi,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "20% OFF",
                              style: AppTextStyles.interBold(
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 10,
                          right: 10,
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 14,
                              color: Colors.grey[400],
                            ),
                            Text(
                              " 12 KM  ",
                              style: AppTextStyles.interRegular(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            Icon(
                              Icons.access_time,
                              size: 14,
                              color: Colors.grey[400],
                            ),
                            Text(
                              " 20 mins",
                              style: AppTextStyles.interRegular(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Sushi lunch combi",
                          style: AppTextStyles.interBold(fontSize: 16),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "SAR 11,000",
                              style: AppTextStyles.interBold(
                                fontSize: 14,
                                color: AppColors.primary,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 35,
                          width: double.infinity,
                          child: CustomButton(
                            text: "Reserve Deal",
                            onPressed: () {},
                            height: 32,
                            borderRadius: 8,
                            color: AppColors.primary,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategories(bool isDark) {
    List<String> categories = ["ALL", "CONFECTIONERY", "BREAD", "MEAT"];
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isSelected = _selectedCategory == categories[index];
          return CategoryChip(
            label: categories[index],
            isSelected: isSelected,
            onTap: () => setState(() => _selectedCategory = categories[index]),
          );
        },
      ),
    );
  }

  Widget _buildTrendingDeals(bool isDark) {
    List<Map<String, String>> deals = _categoryDeals[_selectedCategory] ?? [];

    if (deals.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Text(
            "No deals available in this category",
            style: AppTextStyles.interMedium(color: Colors.grey),
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: deals.length,
      itemBuilder: (context, index) {
        final deal = deals[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ProductDetailScreen(deal: deal)),
          ),
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: isDark ? AppColors.surfaceDark : Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        deal["image"]!,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      const Positioned(
                        top: 10,
                        right: 10,
                        child: Icon(Icons.favorite_border, color: Colors.white),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Row(
                          children: List.generate(
                            4,
                            (i) => Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.restaurant,
                                    size: 12,
                                    color: Colors.grey[600],
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "20",
                                    style: AppTextStyles.interBold(
                                      fontSize: 10,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        deal["name"]!,
                        style: AppTextStyles.interBold(fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 14,
                            color: Colors.grey[400],
                          ),
                          Text(
                            " 02 KM  ",
                            style: AppTextStyles.interRegular(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: Colors.grey[400],
                          ),
                          Text(
                            " 20 mins",
                            style: AppTextStyles.interRegular(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "SAR 15,000",
                            style: AppTextStyles.interBold(
                              fontSize: 18,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          CustomButton(
                            text: "Reserve Deal",
                            onPressed: () {},
                            width: double.infinity,
                            height: 48,
                            borderRadius: 12,
                            color: AppColors.primary,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBestOffers(bool isDark) {
    List<Map<String, String>> allOffers = [
      {"name": "Macaroon and Jam", "image": AppConstants.roll},
      {"name": "Fresh Brown Bread", "image": AppConstants.roll},
      {"name": "Fresh Banana", "image": AppConstants.banana},
      {"name": "Red Rose", "image": AppConstants.rose},
      {"name": "Special Sushi", "image": AppConstants.suchi},
      {"name": "Fresh Carrot", "image": AppConstants.carrat},
    ];

    List<Map<String, String>> displayedOffers = _showAllBestOffers
        ? allOffers
        : allOffers.take(4).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: displayedOffers.length,
        itemBuilder: (context, index) {
          final deal = displayedOffers[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetailScreen(deal: deal),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: isDark ? AppColors.surfaceDark : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(16),
                    ),
                    child: Image.asset(
                      deal["image"]!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: List.generate(
                              5,
                              (i) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 12,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            deal["name"]!,
                            style: AppTextStyles.interBold(fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "SAR 15,000",
                            style: AppTextStyles.interBold(
                              fontSize: 14,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.grey[400],
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAmazingDeals(bool isDark) {
    List<Map<String, String>> deals = [
      {"name": "Macaroon and Jam", "image": AppConstants.roll},
      {"name": "Fresh Brown Bread", "image": AppConstants.roll},
      {"name": "Fresh Banana", "image": AppConstants.banana},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: deals.length,
      itemBuilder: (context, index) {
        final deal = deals[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ProductDetailScreen(deal: deal)),
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: isDark ? AppColors.surfaceDark : Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    children: [
                      Image.asset(
                        deal["image"]!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.error,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Hot Deal",
                            style: AppTextStyles.interBold(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 10,
                        right: 10,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 18,
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Row(
                          children: List.generate(
                            4,
                            (i) => Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "20",
                                style: AppTextStyles.interBold(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Row(
                      children: List.generate(
                        3,
                        (i) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "(4.0)",
                      style: AppTextStyles.interRegular(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "Limited",
                      style: AppTextStyles.interMedium(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  deal["name"]!,
                  style: AppTextStyles.interBold(fontSize: 18),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      "By Merchant ",
                      style: AppTextStyles.interRegular(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "Confectionery",
                      style: AppTextStyles.interBold(
                        fontSize: 14,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "SAR 15,000  ",
                      style: AppTextStyles.interBold(
                        fontSize: 18,
                        color: AppColors.primary,
                      ),
                    ),
                    Text(
                      "SAR 18,000",
                      style: AppTextStyles.interRegular(
                        fontSize: 14,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "4.5%",
                      style: AppTextStyles.interBold(
                        fontSize: 14,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "Buy Deal",
                        onPressed: () {},
                        height: 48,
                        borderRadius: 12,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 48),
                          side: BorderSide(color: AppColors.primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "View Details",
                          style: AppTextStyles.interBold(
                            fontSize: 16,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTopDealsThisWeek(bool isDark) {
    List<Map<String, String>> deals = [
      {
        "name": "Fresh Sweet Roast",
        "image": AppConstants.roll,
        "price": "SAR 1,000",
      },
      {
        "name": "Fresh Banana milk",
        "image": AppConstants.banana,
        "price": "SAR 450",
      },
      {
        "name": "Local farm carrot",
        "image": AppConstants.carrat,
        "price": "SAR 2,000",
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: deals.length,
      itemBuilder: (context, index) {
        final dealItem = deals[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProductDetailScreen(deal: dealItem),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: isDark ? AppColors.surfaceDark : Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        dealItem["image"]!,
                        height: 220,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: -20,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Color(0xFF1B5E20), // Dark green from image
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.shopping_basket,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  dealItem["price"]!,
                  style: AppTextStyles.interBold(
                    fontSize: 18,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  dealItem["name"]!,
                  style: AppTextStyles.interMedium(fontSize: 16),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomNav(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        border: Border(
          top: BorderSide(color: isDark ? Colors.white10 : Colors.grey[200]!),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: AppTextStyles.interMedium(fontSize: 12),
        unselectedLabelStyle: AppTextStyles.interRegular(fontSize: 12),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined),
            label: "My Deals",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: "Wallet",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
