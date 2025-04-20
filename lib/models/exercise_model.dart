class ExerciseModel {
  final String id;
  final String name;
  final String type;
  final String bodyPart;
  final String animationAsset;

  ExerciseModel({
    required this.id,
    required this.name,
    required this.type,
    required this.bodyPart,
    required this.animationAsset,
  });

  ExerciseModel copyWith({
    String? id,
    String? name,
    String? type,
    String? bodyPart,
    String? animationAsset,
  }) {
    return ExerciseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      bodyPart: bodyPart ?? this.bodyPart,
      animationAsset: animationAsset ?? this.animationAsset,
    );
  }

  Map<String, dynamic> toMap() => {
    '_id': id,
    'name': name,
    'type': type,
    'bodyPart': bodyPart,
    'animationAsset': animationAsset,
  };

  factory ExerciseModel.fromMap(Map<String, dynamic> map) => ExerciseModel(
    id: map['_id'],
    name: map['name'],
    type: map['type'],
    bodyPart: map['bodyPart'],
    animationAsset: map['animationAsset'],
  );
}
