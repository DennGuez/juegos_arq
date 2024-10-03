import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onPressed;

  const MenuButton(this.text, this.icon, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
          alignment: Alignment(-1, 0),
          foregroundColor: Colors.black,
          backgroundColor: const Color.fromARGB(255, 255, 205, 6),
          minimumSize: const Size(double.infinity, 50),
        ),
        icon: Icon(icon,),
        label: Text(text, style: TextStyle(fontSize: 19)),
        onPressed: onPressed
      ),
    );
  }
}
