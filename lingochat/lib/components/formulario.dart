import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormularioScreen extends StatefulWidget {
  const FormularioScreen({super.key});

  @override
  _FormularioScreenState createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();

  String? _opcionSeleccionada1;
  String? _opcionSeleccionada2;

  Future<void> _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance.collection('usuarios').add({
          'nombre': _nombreController.text,
          'opcion1': _opcionSeleccionada1,
          'opcion2': _opcionSeleccionada2,
          'descripcion': _descripcionController.text,
        });

        _nombreController.clear();
        _descripcionController.clear();
        _opcionSeleccionada1 = null;
        _opcionSeleccionada2 = null;

        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Datos guardados exitosamente')),
        );
      } catch (e) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al guardar los datos')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16.0,
            right: 16.0,
            top: 16.0,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 32),
                const Center(
                  child: Text(
                    'Crear IA',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 32),
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
                  decoration: const InputDecoration(labelText: 'Genero'),
                  items: ['Masculino', 'Femenino', 'Otro']
                      .map((categoria) => DropdownMenuItem(
                            value: categoria,
                            child: Text(categoria),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _opcionSeleccionada1 = value;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Seleccione una categoría' : null,
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _opcionSeleccionada2,
                  decoration: const InputDecoration(labelText: 'Idioma'),
                  items:
                      ['Español', 'Inglés', 'Italiano', 'Japonés', 'Portugués']
                          .map((prioridad) => DropdownMenuItem(
                                value: prioridad,
                                child: Text(prioridad),
                              ))
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      _opcionSeleccionada2 = value;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Seleccione una prioridad' : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _descripcionController,
                  decoration: const InputDecoration(
                    labelText: 'Descripción',
                    alignLabelWithHint: true,
                  ),
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
                    onPressed: () => _submitForm(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('REGISTRAR'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
