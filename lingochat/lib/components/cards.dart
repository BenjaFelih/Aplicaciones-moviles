import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color cardColor;

  const CustomCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.cardColor = const Color.fromARGB(255, 142, 142, 142),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 65,
            color: cardColor,
            width: double.infinity,
          ),
          ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
          ),
        ],
      ),
    );
  }
}
