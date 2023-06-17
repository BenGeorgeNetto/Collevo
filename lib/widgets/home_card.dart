import 'package:collevo/colors.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String buttonText;
  final String cardText;

  const HomeCard({
    super.key,
    required this.buttonText,
    required this.cardText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardText,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  backgroundColor: CustomColors.buttonBlue,
                ),
                child: Text(
                  buttonText,
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
