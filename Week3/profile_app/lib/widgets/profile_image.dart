import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String image;
  const ProfileImage(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 4),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
    );
  }
}
