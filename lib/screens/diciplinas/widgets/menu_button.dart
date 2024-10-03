import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// final Uri _url = Uri.parse(
//     'https://drive.google.com/drive/folders/1-0AFWlvJcw688ZWto3YMh-Ngp6ByPekI');

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
          alignment: Alignment(0, 0),
          foregroundColor: Colors.black,
          backgroundColor: const Color.fromARGB(255, 177, 213, 255),
          minimumSize: const Size(double.infinity, 50),
        ),
        // icon: Icon(icon,),
        label: Text(text, style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
        onPressed: onPressed,
      ),
    );
  }
}

// Future<void> _launchUrl() async {
//   if (!await launchUrl(_url)) {
//     throw Exception('Could not launch $_url');
//   }
// }