import 'package:flutter/material.dart';
import 'package:school_app/models/anecdotal_categories_model.dart';

class FilterCard extends StatefulWidget {
  final AnecdotalCategoryModel? anecdotalCategories;
  final Function(String?) onCategorySelected;
  const FilterCard({
    super.key,
    required this.anecdotalCategories,
    required this.onCategorySelected,
  });

  @override
  State<FilterCard> createState() => _FilterCardState();
}

class _FilterCardState extends State<FilterCard> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    // final categories = widget.anecdotalCategories?.data ?? [];
    final categories = ["All", ...?widget.anecdotalCategories?.data];

    return Container(
      width: double.infinity, // ✅ makes it take full width
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 1, offset: Offset(0, 0)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // ✅ makes height fit content
        children: [
          const Text(
            "Filter by Category",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          if (categories.isEmpty)
            const Text(
              "No categories available",
              style: TextStyle(color: Colors.grey),
            )
          else
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  // final isSelected = selectedCategory == category;
                  final isSelected =
                      selectedCategory == category ||
                      (selectedCategory == null && category == "All");
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: isSelected,
                      // onSelected: (selected) {
                      //   setState(() {
                      //     selectedCategory = selected ? category : null;
                      //   });
                      //   widget.onCategorySelected(selectedCategory);
                      // },
                      onSelected: (selected) {
                        setState(() {
                          selectedCategory = selected
                              ? (category == "All" ? null : category)
                              : null;
                        });
                        // ✅ Send null if “All” selected
                        widget.onCategorySelected(
                          category == "All" ? null : selectedCategory,
                        );
                      },
                      selectedColor: const Color(0xFFF0f8278),
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
