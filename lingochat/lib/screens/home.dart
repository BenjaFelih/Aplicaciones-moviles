import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lingochat/components/appbar.dart';
import 'package:lingochat/components/formulario.dart';
import 'package:lingochat/screens/logros.dart';
import 'package:lingochat/components/chips.dart';
import 'package:lingochat/components/pro.dart';

class Mantenedor extends StatefulWidget {
  const Mantenedor({super.key});

  @override
  _MantenedorState createState() => _MantenedorState();
}

class _MantenedorState extends State<Mantenedor> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const LogrosScreen(),
    const SearchScreen(),
    const BlogScreen(),
    const CallsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          backgroundColor: const Color.fromRGBO(73, 174, 192, 1),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black54,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline_outlined),
              label: 'Chats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined),
              label: 'Logros',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';

  Future<void> _eliminarUsuario(String id) async {
    await FirebaseFirestore.instance.collection('usuarios').doc(id).delete();
  }

  Future<void> _modificarUsuario(
      String id, Map<String, dynamic> usuario) async {
    final _nombreController = TextEditingController(text: usuario['nombre']);
    final _descripcionController =
        TextEditingController(text: usuario['descripcion']);
    String? _opcionSeleccionada1 = usuario['opcion1'];
    String? _opcionSeleccionada2 = usuario['opcion2'];

    final _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Modificar Usuario'),
          content: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nombreController,
                    decoration:
                        const InputDecoration(labelText: 'Nombre de la IA'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese el nombre de la IA';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: _opcionSeleccionada1,
                    decoration: const InputDecoration(labelText: 'Género'),
                    items: ['Masculino', 'Femenino', 'Otro']
                        .map((categoria) => DropdownMenuItem(
                              value: categoria,
                              child: Text(categoria),
                            ))
                        .toList(),
                    onChanged: (value) {
                      _opcionSeleccionada1 = value;
                    },
                    validator: (value) =>
                        value == null ? 'Seleccione una categoría' : null,
                  ),
                  const SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: _opcionSeleccionada2,
                    decoration: const InputDecoration(labelText: 'Idioma'),
                    items: [
                      'Español',
                      'Inglés',
                      'Italiano',
                      'Japonés',
                      'Portugués'
                    ]
                        .map((prioridad) => DropdownMenuItem(
                              value: prioridad,
                              child: Text(prioridad),
                            ))
                        .toList(),
                    onChanged: (value) {
                      _opcionSeleccionada2 = value;
                    },
                    validator: (value) =>
                        value == null ? 'Seleccione una prioridad' : null,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _descripcionController,
                    decoration: const InputDecoration(labelText: 'Descripción'),
                    maxLines: 4,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese una descripción';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // Actualizar los datos del usuario en Firestore
                          try {
                            await FirebaseFirestore.instance
                                .collection('usuarios')
                                .doc(id)
                                .update({
                              'nombre': _nombreController.text,
                              'opcion1': _opcionSeleccionada1,
                              'opcion2': _opcionSeleccionada2,
                              'descripcion': _descripcionController.text,
                            });

                            // Cerrar el formulario
                            Navigator.of(context).pop();

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Usuario actualizado correctamente')),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Error al actualizar')),
                            );
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('ACTUALIZAR'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          // SearchBar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar usuario...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value.toLowerCase();
                });
              },
            ),
          ),

//chips

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SelectableChipsRow(
              labels: const ['Todas', 'Español', 'Ingles'],
              onSelected: (index) {
                debugPrint('Chip seleccionado: $index');
              },
            ),
          ),

          const SizedBox(height: 12.0),

//card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ProCard(
              onEnablePressed: () {},
            ),
          ),

//recientes

          const SizedBox(height: 16.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Recientes',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Rubik-Regular',
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),

          // Lista de usuarios
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('usuarios').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text('No hay registros disponibles.'),
                  );
                }

                final usuarios = snapshot.data!.docs.where((doc) {
                  final data = doc.data() as Map<String, dynamic>;
                  final nombre = (data['nombre'] as String).toLowerCase();
                  return nombre.contains(_searchQuery);
                }).toList();

                return ListView.separated(
                    itemCount: usuarios.length,
                    separatorBuilder: (context, index) => const Divider(
                          color: Color.fromARGB(255, 235, 235, 235),
                          thickness: 1,
                        ),
                    itemBuilder: (context, index) {
                      final usuarioDoc = usuarios[index];
                      final usuario = usuarioDoc.data() as Map<String, dynamic>;
                      final usuarioId = usuarioDoc.id;

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: usuario['imagen'] != null
                              ? NetworkImage(usuario['imagen'])
                              : null,
                          child: usuario['imagen'] == null
                              ? Text(
                                  usuario['nombre']
                                      .substring(0, 1)
                                      .toUpperCase(),
                                  style: const TextStyle(color: Colors.white),
                                )
                              : null,
                          backgroundColor: Colors.blue,
                        ),
                        title: Text(
                          '${usuario['nombre']}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          usuario['opcion2'] != null
                              ? usuario['opcion2']
                              : 'Idioma no especificado',
                        ),
                        trailing: PopupMenuButton<String>(
                          onSelected: (value) {
                            if (value == 'modificar') {
                              _modificarUsuario(usuarioId, usuario);
                            } else if (value == 'eliminar') {
                              _eliminarUsuario(usuarioId);
                            }
                          },
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 'modificar',
                              child: Text('Modificar'),
                            ),
                            const PopupMenuItem(
                              value: 'eliminar',
                              child: Text('Eliminar'),
                            ),
                          ],
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => FractionallySizedBox(
              heightFactor: 0.9,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Stack(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: FormularioScreen(),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Búsqueda'),
      ),
      body: const Center(
        child: Text('Pantalla de perfil'),
      ),
    );
  }
}

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog'),
      ),
      body: const Center(
        child: Text('Pantalla de blog'),
      ),
    );
  }
}

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mensaje'),
      ),
      body: const Center(
        child: Text('Pantalla de mensajes'),
      ),
    );
  }
}