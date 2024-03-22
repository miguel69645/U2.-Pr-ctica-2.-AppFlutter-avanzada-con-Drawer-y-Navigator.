// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'album.dart';
import 'lista.dart';

class Capturar extends StatefulWidget {
  const Capturar({super.key});

  @override
  State<Capturar> createState() => _CapturarState();
}

final lista = ListaAlbum();

class _CapturarState extends State<Capturar> {
  final nombreAlbum = TextEditingController();
  final banda = TextEditingController();
  final estreno = TextEditingController();
  final genero = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void limpiar() {
    nombreAlbum.clear();
    banda.clear();
    estreno.clear();
    genero.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, bottom: 10, top: 20),
            child: Text(
              "Nombre del Album",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, bottom: 10),
            child: TextFormField(
              controller: nombreAlbum,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingrese Nombre del Album',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese Nombre del Album';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, bottom: 10, top: 10),
            child: Text(
              "Nombre de la Banda",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, bottom: 10),
            child: TextFormField(
              controller: banda,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingrese Nombre de la Banda',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese Nombre de la Banda';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, bottom: 10, top: 10),
            child: Text(
              "Fecha de Estreno del Album",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, bottom: 10),
            child: TextFormField(
              controller: estreno,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingrese el Estreno del Album',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el Estreno del Album';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, bottom: 10, top: 10),
            child: Text(
              "Genero del Album",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: TextFormField(
              controller: genero,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingrese Genero del Album',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese el Genero del Album';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, bottom: 10, top: 30),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Nuevo
                  setState(() {
                    Album nuevoAlbum = Album(
                      nombreAlbum: nombreAlbum.text,
                      banda: banda.text,
                      estreno: estreno.text,
                      genero: genero.text,
                    );
                    lista.nuevo(nuevoAlbum);
                    lista.guardarArchivo();
                    limpiar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Los datos se han guardado exitosamente'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  });
                }
              },
              child: Text("Guardar"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
