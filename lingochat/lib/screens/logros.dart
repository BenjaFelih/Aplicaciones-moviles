import 'package:flutter/material.dart';
import 'package:lingochat/components/cards.dart';

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
              // pestaña CERTIFICADOS
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Progreso general
                    Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Completa 15 desafíos',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: LinearProgressIndicator(
                                  value: 2 / 15,
                                  backgroundColor: Colors.grey[300],
                                  color: const Color.fromRGBO(73, 174, 192, 1),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text('Nivel 1'),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Center(
                            child: ElevatedButton(
                              onPressed: null,
                              child: Text('RECIBIR CERTIFICADO'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Desafíos diarios
                    const Text(
                      'Desafíos diarios',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildChallengeRow('Comenzar chat', 1, 1),
                    _buildChallengeRow('Crear chatbot', 2, 5),
                    _buildChallengeRow('Adopción de modismos', 10, 16),
                    const SizedBox(height: 16),
                    // Desafíos semanales
                    const Text(
                      'Desafíos Semanales',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildChallengeRow('Chatear todos los días', 3, 7),
                    _buildChallengeRow('Traducir mensajes', 4, 5),
                    _buildChallengeRow('Usar modismos en mensajes', 0, 10),
                    _buildChallengeRow('Racha de mensajes sin errores', 0, 50),
                    _buildChallengeRow(
                        'Hablar con un chat-bot específico', 1, 1),
                  ],
                ),
              ),
              // pestaña OBJETIVOS
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChallengeRow(String title, int current, int total) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 4),
                LinearProgressIndicator(
                  value: current / total,
                  backgroundColor: Colors.grey[300],
                  color: const Color.fromRGBO(73, 174, 192, 1),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text('$current / $total'),
        ],
      ),
    );
  }
}
