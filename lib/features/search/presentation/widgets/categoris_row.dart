import 'package:flutter/material.dart';
import 'package:qent/constants.dart';

class CategoriesRow extends StatelessWidget {
  final bool isSelected;
  final VoidCallback? onTap;
  const CategoriesRow({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          duration: Duration(milliseconds: 300),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),

                  child: Center(
                    child: Image.asset(
                      'assets/images/tesla_icon.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "Tesla",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
