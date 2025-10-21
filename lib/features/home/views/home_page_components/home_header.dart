import 'package:flutter/material.dart';
import '../../../../core/utils/constants.dart';
import 'categories.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "PakaPaka Market",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        Categories(),
      ],
    );
  }
}
