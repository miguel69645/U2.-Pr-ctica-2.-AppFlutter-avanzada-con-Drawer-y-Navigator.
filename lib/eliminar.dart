// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'capturar.dart';

class Eliminar extends StatefulWidget {
  const Eliminar({super.key});

  @override
  State<Eliminar> createState() => _EliminarState();
}

class _EliminarState extends State<Eliminar> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _animation,
        child: ElevatedButton(
          child: Text("Borrar Almacen"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            textStyle: TextStyle(
              fontSize: 20,
            ),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Confirmación'),
                  content: Text(
                      '¿Estás seguro de que deseas eliminar todos los datos?'),
                  actions: [
                    TextButton(
                      child: Text('Cancelar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('Aceptar'),
                      onPressed: () async {
                        await lista.borrarAlmacen();
                        lista.data.clear();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
