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
        appBar: AppBar(
          title: const Text('Entregar ahora'),
          actions: const [
            Icon(Icons.shopping_cart_checkout),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.settings_accessibility),
            )
          ],
        ),
        body: ListView(
          children: [
            const SizedBox(height: 20.0, width: 12.0),

            //barra search
            Padding(
              padding: const EdgeInsets.all(10.0), // This is your margin
              child: Container(
                height: 70.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 207, 207, 207),
                  borderRadius:
                      BorderRadius.circular(45.0), // This is the border radius
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.search, size: 24.0), // Icon to the right
                    Text('Busca Uber Eats'),
                    Icon(Icons.tune, size: 24.0), // Icon to the right
                  ],
                ),
              ),
            ),

            //row 1

            Padding(
              padding: const EdgeInsets.all(10.0), // Margin
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Space between the two containers
                children: [
                  Expanded(
                    child: Container(
                      height: 90.0,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 207, 207, 207),
                        borderRadius:
                            BorderRadius.circular(10.0), // Border radius
                      ),
                      child: const Center(child: Text('Restaurantes')),
                    ),
                  ),

                  const SizedBox(width: 10.0), // Space between the containers

                  Expanded(
                    child: Container(
                      height: 90.0,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 207, 207, 207),
                        borderRadius:
                            BorderRadius.circular(10.0), // Border radius
                      ),
                      child: const Center(child: Text('Súper')),
                    ),
                  ),
                ],
              ),
            ),

//row 2

            Padding(
              padding: const EdgeInsets.all(10.0), // Margin
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Space between the two containers
                children: [
                  Expanded(
                    child: Container(
                      height: 90.0,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 207, 207, 207),
                        borderRadius:
                            BorderRadius.circular(10.0), // Border radius
                      ),
                      child: const Center(child: Text('Restaurantes')),
                    ),
                  ),

                  const SizedBox(width: 10.0), // Space between the containers

                  Expanded(
                    child: Container(
                      height: 90.0,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 207, 207, 207),
                        borderRadius:
                            BorderRadius.circular(10.0), // Border radius
                      ),
                      child: const Center(child: Text('Súper')),
                    ),
                  ),

                  const SizedBox(width: 10.0), // Space between the containers

                  Expanded(
                    child: Container(
                      height: 90.0,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 207, 207, 207),
                        borderRadius:
                            BorderRadius.circular(10.0), // Border radius
                      ),
                      child: const Center(child: Text('Súper')),
                    ),
                  ),

                  const SizedBox(width: 10.0), // Space between the containers

                  Expanded(
                    child: Container(
                      height: 90.0,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 207, 207, 207),
                        borderRadius:
                            BorderRadius.circular(10.0), // Border radius
                      ),
                      child: const Center(child: Text('Súper')),
                    ),
                  ),
                ],
              ),
            ),

//row 3

            Padding(
              padding: const EdgeInsets.all(10.0), // This is your margin
              child: Container(
                height: 250.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 201, 177, 19),
                  borderRadius:
                      BorderRadius.circular(20.0), // This is the border radius
                ),
              ),
            ),

//texto restaurante

            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Restaurante X',
                style: TextStyle(fontSize: 25),
              ),
            ),

            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Costo de envío x',
                style: TextStyle(fontSize: 15),
              ),
            ),

            //volver a pedir
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Volver a pedir',
                style: TextStyle(fontSize: 35),
              ),
            ),

            //volver a pedir cajas
            Padding(
              padding: const EdgeInsets.all(10.0), // Margin
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Space between the two containers
                children: [
                  Expanded(
                    child: Container(
                      height: 120.0,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 207, 207, 207),
                        borderRadius:
                            BorderRadius.circular(10.0), // Border radius
                      ),
                    ),
                  ),

                  const SizedBox(width: 10.0), // Space between the containers

                  Expanded(
                    child: Container(
                      height: 120.0,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 207, 207, 207),
                        borderRadius:
                            BorderRadius.circular(10.0), // Border radius
                      ),
                    ),
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
