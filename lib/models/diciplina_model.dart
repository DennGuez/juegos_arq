class DisciplinaModel {
  final String disciplina;
  final List<Map<String, dynamic>>  modalidad;

  DisciplinaModel({
    required this.disciplina,
    required this.modalidad
  });

  factory DisciplinaModel.fromJson(Map<String, dynamic> json) => DisciplinaModel(
    disciplina: json['disciplina'] ?? 'No tiene disciplina',
    modalidad: json['modalidad'] ?? 'No tiene modalidad'
  );
}
