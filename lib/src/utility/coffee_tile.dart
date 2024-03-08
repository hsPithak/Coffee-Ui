import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeTile extends StatelessWidget {
  final String coffeeImagePath;
  final String coffeeName;
  final String coffeeIngredient;
  final String coffeePrice;

  const CoffeeTile({
    super.key,
    required this.coffeeImagePath,
    required this.coffeeName,
    required this.coffeeIngredient,
    required this.coffeePrice, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 35.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.black54
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(coffeeImagePath),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(coffeeName,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                    ),),
                  const SizedBox(height: 4.0,),
                  Text(coffeeIngredient,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey.shade700
                    ),),
                ],
              ),
            ),

            // price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text( "\$$coffeePrice",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                ),),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.blueAccent.shade400
                  ),
                  child: const Icon(Icons.add),)
              ],
            )

          ],
        ),
      ),
    );
  }
}
