// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'album.dart';
import 'capturar.dart';

class Mostrar extends StatefulWidget {
  const Mostrar({super.key});

  @override
  State<Mostrar> createState() => _MostrarState();
}

class _MostrarState extends State<Mostrar> {
  @override
  Widget build(BuildContext context) {
    lista.cargarArchivo();
    return ListView.separated(
      itemCount: lista.data.length,
      itemBuilder: (context, index) {
        Album cargaralbum = lista.data[index];
        return Dismissible(
          key: Key(cargaralbum.nombreAlbum),
          onDismissed: (direction) {
            setState(() {
              lista.data.removeAt(index);
            });
            lista.guardarArchivo();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("${cargaralbum.nombreAlbum} eliminado")),
            );
          },
          background: Container(
            color: Colors.red,
            child: Icon(Icons.delete, color: Colors.white),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 20),
          ),
          secondaryBackground: Container(
            color: Colors.red,
            child: Icon(Icons.delete, color: Colors.white),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20),
          ),
          child: ListTile(
            title: Text(cargaralbum.banda),
            subtitle: Text(
                'Estreno: ${cargaralbum.estreno}, Genero: ${cargaralbum.genero}'),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
