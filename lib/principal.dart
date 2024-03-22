// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, non_constant_identifier_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'main.dart';
import 'capturar.dart';
import 'mostrar.dart';
import 'eliminar.dart';
import 'actualizar.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int _selectedindex = 0;

  Widget dinamico() {
    Widget drawer = Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.person,
                    color: Colors.blue,
                    size: 50,
                  ),
                  radius: 30,
                ),
                Text(
                  'Miguel Carrillo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "(C) Tec Tepic",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text("Capturar"),
            leading: Icon(Icons.add),
            selected: _selectedindex == 1,
            onTap: () {
              setState(() {
                _selectedindex = 1;
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            title: Text("Mostrar"),
            leading: Icon(Icons.search),
            selected: _selectedindex == 2,
            onTap: () {
              setState(() {
                _selectedindex = 2;
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            title: Text("Eliminar"),
            leading: Icon(Icons.delete),
            selected: _selectedindex == 3,
            onTap: () {
              setState(() {
                _selectedindex = 3;
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            title: Text("Actualizar"),
            leading: Icon(Icons.update),
            selected: _selectedindex == 4,
            onTap: () {
              setState(() {
                _selectedindex = 4;
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            title: Text("Cerrar Sesion"),
            leading: Icon(Icons.exit_to_app),
            selected: _selectedindex == 5,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Confirmación'),
                    content:
                        Text('¿Estás seguro de que deseas cerrar la sesión?'),
                    actions: [
                      TextButton(
                        child: Text('Cancelar'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Aceptar'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
    switch (_selectedindex) {
      case 0:
        return Scaffold(
          appBar: AppBar(
            title: Text("BIENVENIDO"),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(93, 160, 239, 1),
            foregroundColor: Colors.white,
          ),
          body: Bienvenido(),
          drawer: drawer,
        );
      case 1:
        return Scaffold(
          appBar: AppBar(
            title: Text("CAPTURAR"),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(93, 160, 239, 1),
            foregroundColor: Colors.white,
          ),
          body: Capturar(),
          drawer: drawer,
        );
      case 2:
        return Scaffold(
          appBar: AppBar(
            title: Text("MOSTRAR"),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(93, 160, 239, 1),
            foregroundColor: Colors.white,
          ),
          body: Mostrar(),
          drawer: drawer,
        );
      case 3:
        return Scaffold(
          appBar: AppBar(
            title: Text("ELIMINAR"),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(93, 160, 239, 1),
            foregroundColor: Colors.white,
          ),
          body: Eliminar(),
          drawer: drawer,
        );
      case 4:
        return Scaffold(
          appBar: AppBar(
            title: Text("ACTUALIZAR"),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(93, 160, 239, 1),
            foregroundColor: Colors.white,
          ),
          body: Actualizar(),
          drawer: drawer,
        );
      default:
        return Scaffold(
          appBar: AppBar(
            title: Text("BIENVENIDO"),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(93, 160, 239, 1),
            foregroundColor: Colors.white,
          ),
          body: Bienvenido(),
          drawer: drawer,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dinamico(),
    );
  }

  Widget Bienvenido() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Bienvenido a la aplicación',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Image.network(
            'https://blog.codemagic.io/uploads/covers/codemagic-blog-header-upgrading-to-Material-3.png',
            height: 300,
            width: 350,
          ),
          SizedBox(height: 20),
          Text(
            'Aquí puedes capturar, mostrar, eliminar y actualizar datos.',
            style: TextStyle(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget CerrarSesion() {
    return Container(
      child: Text('Cerrar Sesion'),
    );
  }
}
