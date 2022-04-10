import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  final String imagePath;

  const StoryWidget({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(5.0),
        height: 100.0,
        width: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60.0),
          color: Colors.transparent,
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
