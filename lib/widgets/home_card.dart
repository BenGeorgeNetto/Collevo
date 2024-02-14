import 'package:collevo/colors.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String cardText;
  final String routeName;

  const HomeCard({
    super.key,
    required this.cardText,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth * 0.4;

    return Padding(
      padding: const EdgeInsets.all(.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: darkColorScheme.surface,
          ),
          height: containerWidth,
          width: containerWidth,
          child: OverflowBox(
            maxWidth: containerWidth,
            maxHeight: containerWidth,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  cardText,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
  //     child: Card(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(12.0),
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               cardText,
  //               style: Theme.of(context).textTheme.bodyMedium,
  //             ),
  //             ElevatedButton(
  //               onPressed: () {},
  //               style: ElevatedButton.styleFrom(
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(16.0),
  //                 ),
  //                 backgroundColor: CustomColors.buttonBlue,
  //               ),
  //               child: Text(
  //                 buttonText,
  //                 style: Theme.of(context).textTheme.bodyMedium,
  //               )
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
