class DisciplinaFilterModel {
  final int id;
  final String fecha;
  final String hora;
  final String partido;
  final String disciplina;
  final String modalidad;
  final String categoria;
  final String? cancha;
  final String? resultado;
  final DateTime date;

  DisciplinaFilterModel({
    required this.id, 
    required this.fecha, 
    required this.hora, 
    required this.partido, 
    required this.disciplina, 
    required this.modalidad, 
    required this.categoria, 
    required this.cancha, 
    required this.resultado, 
    required this.date
  });

  factory DisciplinaFilterModel.fromJson(Map<String, dynamic> json) {
    return DisciplinaFilterModel(
      id: json['id'],
      fecha: json['fecha'],
      hora: json['hora'],
      partido: json['partido'],
      disciplina: json['disciplina'],
      modalidad: json['modalidad'],
      categoria: json['categoria'],
      cancha: json['cancha'],
      resultado: json['resultado'],
      date: DateTime.parse(json['date']),
    );
  }



}