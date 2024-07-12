import 'package:flutter/material.dart';
import 'package:pakdoekang/widgets/buttons/category_btn.dart';

class CategorySelector extends StatelessWidget {
  final List<String> selectedCategories;
  final void Function(String) onCategoryTap;

  CategorySelector(
      {required this.selectedCategories, required this.onCategoryTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 16),
          MyCategoryButton.kuliah(
            isSelected: selectedCategories.contains("Kuliah"),
            onTap: () => onCategoryTap("Kuliah"),
          ),
          SizedBox(width: 10),
          MyCategoryButton.makan(
            isSelected: selectedCategories.contains("Makan"),
            onTap: () => onCategoryTap("Makan"),
          ),
          SizedBox(width: 10),
          MyCategoryButton.belanja(
            isSelected: selectedCategories.contains("Belanja"),
            onTap: () => onCategoryTap("Belanja"),
          ),
          SizedBox(width: 10),
          MyCategoryButton.hiburan(
            isSelected: selectedCategories.contains("Hiburan"),
            onTap: () => onCategoryTap("Hiburan"),
          ),
          SizedBox(width: 10),
          MyCategoryButton.gajian(
            isSelected: selectedCategories.contains("Gajian"),
            onTap: () => onCategoryTap("Gajian"),
          ),
          SizedBox(width: 10),
          MyCategoryButton.tabungan(
            isSelected: selectedCategories.contains("Tabungan"),
            onTap: () => onCategoryTap("Tabungan"),
          ),
          SizedBox(width: 10),
          MyCategoryButton.iuran(
            isSelected: selectedCategories.contains("Iuran"),
            onTap: () => onCategoryTap("Iuran"),
          ),
          SizedBox(width: 10),
          MyCategoryButton.utang(
            isSelected: selectedCategories.contains("Utang"),
            onTap: () => onCategoryTap("Utang"),
          ),
          SizedBox(width: 10),
          MyCategoryButton.hadiah(
            isSelected: selectedCategories.contains("Hadiah"),
            onTap: () => onCategoryTap("Hadiah"),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
