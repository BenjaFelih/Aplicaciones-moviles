import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor:
            const Color.fromARGB(255, 223, 223, 223), // cambiar color aca
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const Icon(Icons.arrow_back, color: Colors.black),
          title: const Text(
            'Certamen 1 Benja de la Cerda',
            style: TextStyle(color: Colors.black),
          ),
          actions: const [
            Icon(Icons.check, color: Colors.black),
          ],
          centerTitle: true,
        ),

        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(12.0), // Margin
              height: 150.0,
              width: double.infinity,
              color: const Color.fromARGB(255, 97, 93, 93),
              child: const Text('<----'),
            ),

            Container(
              height: 150.0,
              width: double.infinity,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: const Center(child: Text('Z.INGENIERIA')),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 70.0,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: const Center(child: Text('Guardar')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 70.0,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: const Center(child: Text('Compartir')),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 70.0,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: const Center(child: Text('Sitio web')),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12.0),
            //scroll horizontal

            Container(
              padding: const EdgeInsets.all(12.0),
              height: 50.0,
              width: double.infinity,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: const Text('17 proyectos'),
            ),
            Container(
              padding: const EdgeInsets.all(10.0), // Margin
              height: 250.0, // Altura de 148 píxeles
              color: Colors.transparent,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 200,
                      margin: const EdgeInsets.only(right: 12.0),
                      color: const Color.fromARGB(
                          255, 47, 47, 47), // Color de fondo naranja
                      child: const Center(child: Text('01. CLÍNICA DENTAL')),
                    ),
                    Container(
                      width: 200,
                      margin: const EdgeInsets.only(right: 12.0),
                      color: const Color.fromARGB(
                          255, 220, 218, 160), // Color de fondo naranja
                      child: const Center(
                          child: Text('REFORMA INTERIOR LOCAL...')),
                    ),
                    Container(
                      width: 200,
                      margin: const EdgeInsets.only(right: 12.0),
                      color: const Color.fromARGB(
                          255, 98, 147, 220), // Color de fondo naranja
                      child: const Center(child: Text('Container 3')),
                    ),
                    Container(
                      width: 200,
                      margin: const EdgeInsets.only(right: 12.0),
                      color: const Color.fromARGB(
                          255, 101, 101, 101), // Color de fondo naranja
                      child: const Center(child: Text('Container 4')),
                    ),
                    Container(
                      width: 200,
                      margin: const EdgeInsets.only(right: 12.0),
                      color: Colors.orange, // Color de fondo naranja
                      child: const Center(child: Text('Container 5')),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(12.0), // Margin
              height: 148.0,
              width: double.infinity,
              color: Colors.transparent,
              child: const Text('Parrafo'),
            ),

            Container(
              padding: const EdgeInsets.all(10.0), // Margin
              height: 120.0, // Altura de 148 píxeles
              color: Colors.transparent,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      margin: const EdgeInsets.only(right: 12.0),
                      color: const Color.fromARGB(
                          255, 47, 47, 47), // Color de fondo naranja
                      child: const Center(child: Text('INVENTADO')),
                    ),
                    Container(
                      width: 100,
                      margin: const EdgeInsets.only(right: 12.0),
                      color: const Color.fromARGB(
                          255, 220, 218, 160), // Color de fondo naranja
                      child: const Center(child: Text('INVENTADO 2')),
                    ),
                    Container(
                      width: 100,
                      margin: const EdgeInsets.only(right: 12.0),
                      color: const Color.fromARGB(
                          255, 98, 147, 220), // Color de fondo naranja
                      child: const Center(child: Text('INVENTADO 3')),
                    ),
                    Container(
                      width: 100,
                      margin: const EdgeInsets.only(right: 12.0),
                      color: const Color.fromARGB(
                          255, 101, 101, 101), // Color de fondo naranja
                      child: const Center(child: Text('INVENTADO 4')),
                    ),
                    Container(
                      width: 100,
                      margin: const EdgeInsets.only(right: 12.0),
                      color: Colors.orange, // Color de fondo naranja
                      child: const Center(child: Text('INVENTADO 5')),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0), // Margin
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Space between the two containers
                children: [
                  Expanded(
                    child: Container(
                      height: 90.0,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 35, 158, 88),
                      ),
                      child: const Center(child: Text('Enviar mensaje')),
                    ),
                  ),
                ],
              ),
            ),
          ], //hasta aca
        ),
      ),
    );
  }
}
