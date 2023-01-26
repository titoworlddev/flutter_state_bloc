class User {
  final String nombre;
  final int edad;
  final List<String> profesiones;

  User({
    required this.nombre,
    required this.edad,
    required this.profesiones,
  });

  // Se usa para crear una copia del objeto y asi mandar un nuevo estado en el
  //bloc y no mutar el estado anterior, aunque no es propio de bloc porque se puede usar para cualquier cosa, pero en le bloc nos sirve para no mutar el estado
  User copyWith({
    String? nombre,
    int? edad,
    List<String>? profesiones,
  }) =>
      User(
        nombre: nombre ?? this.nombre,
        edad: edad ?? this.edad,
        profesiones: profesiones ?? this.profesiones,
      );
}
