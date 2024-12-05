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
      child: SizedBox(
        height:
            200, // Define una altura fija para evitar problemas de tamaño infinito.
        child: Column(
          children: [
            Container(
              height: 65,
              color: cardColor,
              width: double.infinity,
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8.0),
                children: [
                  ListTile(
                    title: Text(title),
                    subtitle: Text(subtitle),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
