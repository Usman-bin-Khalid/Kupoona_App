import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'custom_button.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  RangeValues _priceRange = const RangeValues(20, 70);
  RangeValues _discountRange = const RangeValues(25, 50);

  final List<String> _deals = [
    "Meat Sharing", "Restaurant Deals", "Food",
    "Food", "Meat Sharing", "Restaurant Deals",
    "Meat Sharing", "Food", "Restaurant Deals",
    "Food", "Meat Sharing", "Restaurant Deals",
    "Meat Sharing", "Restaurant Deals", "Food"
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: isDark ? AppColors.backgroundDark : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close)),
              Text("Filter", style: AppTextStyles.poppinsBold(fontSize: 18)),
              const Opacity(opacity: 0, child: IconButton(onPressed: null, icon: Icon(Icons.close))),
            ],
          ),
          const SizedBox(height: 20),
          Text("Price Range", style: AppTextStyles.interBold(fontSize: 16)),
          RangeSlider(
            values: _priceRange,
            min: 0,
            max: 100,
            activeColor: AppColors.primary,
            inactiveColor: Colors.grey.withOpacity(0.3),
            labels: RangeLabels(
              "N${_priceRange.start.toInt()},000",
              "N${_priceRange.end.toInt()},000",
            ),
            onChanged: (values) => setState(() => _priceRange = values),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("N${_priceRange.start.toInt()},000", style: AppTextStyles.interRegular(fontSize: 12, color: Colors.grey)),
              Text("N${_priceRange.end.toInt()},000", style: AppTextStyles.interRegular(fontSize: 12, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 20),
          Text("Discount:", style: AppTextStyles.interBold(fontSize: 16)),
          RangeSlider(
            values: _discountRange,
            min: 0,
            max: 100,
            activeColor: AppColors.primary,
            inactiveColor: Colors.grey.withOpacity(0.3),
            labels: RangeLabels(
              "${_discountRange.start.toInt()}%",
              "${_discountRange.end.toInt()}%",
            ),
            onChanged: (values) => setState(() => _discountRange = values),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${_discountRange.start.toInt()}%", style: AppTextStyles.interRegular(fontSize: 12, color: Colors.grey)),
              Text("${_discountRange.end.toInt()}%", style: AppTextStyles.interRegular(fontSize: 12, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 20),
          Text("Deals", style: AppTextStyles.interBold(fontSize: 16)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _deals.map((deal) {
              bool isSelected = deal == "Food" || deal == "Restaurant Deals" && _deals.indexOf(deal) % 2 == 0;

              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue[900] : (isDark ? Colors.white12 : Colors.grey[200]),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  deal,
                  style: AppTextStyles.interMedium(
                    fontSize: 12,
                    color: isSelected ? Colors.white : (isDark ? Colors.white70 : Colors.black87),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _priceRange = const RangeValues(20, 70);
                      _discountRange = const RangeValues(25, 50);
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text("Reset All", style: AppTextStyles.interBold(fontSize: 16, color: AppColors.primary)),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomButton(
                  text: "Apply Filter",
                  onPressed: () => Navigator.pop(context),
                  borderRadius: 30,
                  height: 56,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
