// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'album.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListaAlbum {
  List<Album> data = [];

  Album toAlbum(String cod) {
    List res = cod.split("&&");
    Album al = Album(
      nombreAlbum: res[0],
      banda: res[1],
      estreno: res[2],
      genero: res[3],
    );
    return al;
  }

  Future<bool> guardarArchivo() async {
    SharedPreferences almacen = await SharedPreferences.getInstance();
    List<String> buffer = [];
    data.forEach((element) {
      buffer.add(element.toString());
    });
    almacen.setStringList("buffer", buffer);
    return true;
  }

  Future cargarArchivo() async {
    SharedPreferences almacen = await SharedPreferences.getInstance();
    List<String> buffer = [];
    buffer = almacen.getStringList("buffer") ?? [];
    data.clear();
    buffer.forEach((element) {
      data.add(toAlbum(element));
    });
  }

  Future<bool> borrarAlmacen() async {
    SharedPreferences almacen = await SharedPreferences.getInstance();
    almacen.remove("buffer");
    return true;
  }

  void nuevo(Album al) {
    data.add(al);
  }

  void eliminar(int pos) {
    data.removeAt(pos);
  }
}
