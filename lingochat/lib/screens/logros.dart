import 'package:flutter/material.dart';
import 'package:lingochat/components/cards.dart'; // Asegúrate de ajustar la ruta si es necesario

class LogrosScreen extends StatelessWidget {
  const LogrosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Logros',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Rubik-Regular',
              fontWeight: FontWeight.w900,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'CERTIFICADOS'),
              Tab(text: 'OBJETIVOS'),
            ],
          ),
          backgroundColor: const Color.fromRGBO(73, 174, 192, 1),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBarView(
            children: [
              // pestaña Certificados
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  // Lista de logros
                  final logros = [
                    {'title': 'Logro 1', 'subtitle': 'Descripción breve'},
                    {'title': 'Logro 2', 'subtitle': 'Descripción breve'},
                    {'title': 'Logro 3', 'subtitle': 'Descripción breve'},
                    {'title': 'Logro 4', 'subtitle': 'Descripción breve'},
                    {'title': 'Logro 5', 'subtitle': 'Descripción breve'},
                    {'title': 'Logro 6', 'subtitle': 'Descripción breve'},
                    {'title': 'Logro 7', 'subtitle': 'Descripción breve'},
                    {'title': 'Logro 8', 'subtitle': 'Descripción breve'},
                    {'title': 'Logro 9', 'subtitle': 'Descripción breve'},
                    {'title': 'Logro 10', 'subtitle': 'Descripción breve'},
                    {'title': 'Logro 11', 'subtitle': 'Descripción breve'},
                    {'title': 'Logro 12', 'subtitle': 'Descripción breve'},
                  ];

                  return CustomCard(
                    title: logros[index]['title']!,
                    subtitle: logros[index]['subtitle']!,
                  );
                },
              ),
              // pestaña Objetivoss
              const Center(
                child: Text(
                  'Favoritos',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
