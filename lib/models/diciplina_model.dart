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

// {
//     "disciplina": "FUTBOL",
//     "modalidad": [
//         {
//             "nombre": "FUTBOL 8 VARONES",
//             "categoria": [
//                 "CATEGORÍA MASTER",
//                 "CATEGORÍA MASTER ORO"
//             ]
//         },
//         {
//             "nombre": "FUTBOL 11 VARONES",
//             "subcategoria": [
//                 "CATEGORÍA LIBRE",
//                 "CATEGORÍA SENIOR"
//             ]
//         }
//     ]
// }
