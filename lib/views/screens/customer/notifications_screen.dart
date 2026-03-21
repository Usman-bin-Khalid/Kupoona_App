import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
        title: Row(
          children: [
            Text("Notifications", style: AppTextStyles.interBold(fontSize: 18)),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
              child: Text("4", style: AppTextStyles.interBold(fontSize: 10, color: Colors.white)),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("Mark all read", style: AppTextStyles.interMedium(fontSize: 12, color: Colors.blue)),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          _buildNotificationItem(
            context,
            "Deal Expiring Soon!",
            "Sushi Lunch Combo deal expires in 2 hours. Reserve now before it's gone!",
            "2 min ago",
            isNew: true,
            icon: Icons.notifications_active,
            iconBg: Colors.blue,
            imagePath: AppConstants.suchi,
          ),
          _buildNotificationItem(
            context,
            "Order Confirmed!",
            "Your order #1243 for Fresh Brown Bread has been confirmed. Pick up by 5:00 PM.",
            "15 min ago",
            isNew: true,
            icon: Icons.shopping_basket,
            iconBg: Colors.green,
            imagePath: AppConstants.roll,
          ),
          _buildNotificationItem(
            context,
            "New Deal Alert! 🎉",
            "Red Roses bouquet now 40% off! Perfect for the weekend. Limited stock available.",
            "1 hour ago",
            isNew: true,
            icon: Icons.local_offer,
            iconBg: Colors.orange,
            imagePath: AppConstants.rose,
          ),
          _buildNotificationItem(
            context,
            "Group Deal Reached! 🙌",
            "The group deal for Organic Carrot reached its target! Your discount has been applied.",
            "3 hours ago",
            icon: Icons.people,
            iconBg: Colors.indigo,
          ),
          _buildNotificationItem(
            context,
            "Delivery Update",
            "Your order #1243 is out for delivery. Expected arrival in 30 minutes.",
            "5 hours ago",
            icon: Icons.local_shipping,
            iconBg: Colors.teal,
          ),
          _buildNotificationItem(
            context,
            "Weekend Flash Sale",
            "Up to 50% off on all restaurant deals this weekend. Don't miss out!",
            "Yesterday",
            icon: Icons.flash_on,
            iconBg: Colors.amber,
          ),
          _buildNotificationItem(
            context,
            "Welcome to Kuponna!",
            "Start exploring amazing group deals near you. Save more when you shop together!",
            "3 days ago",
            icon: Icons.waving_hand,
            iconBg: Colors.purple,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(
    BuildContext context,
    String title,
    String message,
    String time, {
    bool isNew = false,
    required IconData icon,
    required Color iconBg,
    String? imagePath,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: iconBg.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                child: Icon(icon, color: iconBg, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(title, style: AppTextStyles.interBold(fontSize: 14)),
                        Text(time, style: AppTextStyles.interRegular(fontSize: 10, color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      message,
                      style: AppTextStyles.interRegular(fontSize: 13, color: isDark ? Colors.white70 : Colors.black87),
                    ),
                    if (imagePath != null) ...[
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(imagePath, height: 100, width: double.infinity, fit: BoxFit.cover),
                      ),
                    ],
                  ],
                ),
              ),
              if (isNew) ...[
                const SizedBox(width: 8),
                Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle)),
              ],
            ],
          ),
        ),
        Divider(color: Colors.grey.withOpacity(0.1), height: 1),
      ],
    );
  }
}
