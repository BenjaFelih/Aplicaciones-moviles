import 'package:flutter/material.dart';
import 'package:lingochat/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 1.0; // Opacidad inicial

  @override
  void initState() {
    super.initState();
    // Inicia la animación
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        opacity = 0.0; // Cambia la opacidad a 0
      });

      // Navega a HomeScreen después de la espera y la animación
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: opacity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/img/logo.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 20),
              const Text(
                'LingoChat',
                style: TextStyle(
                  fontFamily: 'Rubik-Regular',
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
