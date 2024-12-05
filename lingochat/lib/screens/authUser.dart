import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lingochat/screens/home.dart'; // Asegúrate de que esta ruta esté correcta
import 'package:lingochat/screens/register.dart';
import 'package:lingochat/screens/sign.dart'; // La ruta para la pantalla de inicio de sesión

class AuthUser extends StatelessWidget {
  const AuthUser({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: _getCurrentUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Muestra una pantalla de carga mientras se obtiene el usuario
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          // Si ocurre un error, muestra un mensaje
          return const Center(
              child: Text("Error al obtener el estado de autenticación"));
        }

        if (snapshot.hasData) {
          // Si el usuario está autenticado
          return const HomeScreen();
        } else {
          // Si el usuario no está autenticado, mostramos los botones
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Título de la aplicación
                  const Text(
                    'Bienvenido a tu App',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(
                          255, 0, 0, 0), // Cambia el color según tu diseño
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40), // Espacio debajo del título

                  // Botón Iniciar sesión
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Acción al presionar "Iniciar sesión"
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context)
                            .primaryColor, // Fondo con el colr primario
                        foregroundColor: const Color.fromARGB(
                            255, 255, 255, 255), // Texto negro
                        minimumSize:
                            const Size(double.infinity, 48), // Altura de 48 px
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8), // Bordes redondeados de 8 píxeles
                        ),
                      ),
                      child: const Text(
                        'Iniciar sesión',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32), // Separación de 32 píxeles

                  // Divider entre los botones
                  Divider(
                    color: Colors.grey.shade400, // Color del Divider
                    thickness: 1, // Grosor del Divider
                    indent: 20, // Espacio a la izquierda
                    endIndent: 20, // Espacio a la derecha
                    height: 1, // Altura del Divider
                  ),

                  const SizedBox(
                      height:
                          32), // Separación de 32 píxeles entre el Divider y el siguiente botón

                  // Botón Registrarse
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        // Acción al presionar "Registrarse"
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()),
                        );
                      },
                      style: TextButton.styleFrom(
                        foregroundColor:
                            Theme.of(context).primaryColor, // Color del texto
                        minimumSize:
                            const Size(double.infinity, 48), // Altura de 48 px
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8), // Bordes redondeaos de 8 píxeles
                        ),
                      ),
                      child: const Text(
                        'Registrarse',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  // Método que devuelve el usuario actual
  Future<User?> _getCurrentUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user;
  }
}
