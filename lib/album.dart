class Album {
  String nombreAlbum;
  String banda;
  String estreno;
  String genero;

  Album({
    required this.nombreAlbum,
    required this.banda,
    required this.estreno,
    required this.genero,
  });

  @override
  String toString() {
    return "$nombreAlbum&&$banda&&$estreno&&$genero";
  }
}
