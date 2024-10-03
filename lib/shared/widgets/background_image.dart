import 'package:flutter/material.dart';

class backgroundImage extends StatelessWidget {
  const backgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background-arq.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}