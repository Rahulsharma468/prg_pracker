import './exercise_model.dart';

class WorkoutModel {
  final String id;
  final String name;
  final String day;
  final List<ExerciseModel> exercises;

  WorkoutModel({
    required this.id,
    required this.name,
    required this.day,
    required this.exercises,
  });

  WorkoutModel copyWith({
    String? id,
    String? name,
    String? day,
    List<ExerciseModel>? exercises,
  }) {
    return WorkoutModel(
      id: id ?? this.id,
      name: name ?? this.name,
      day: day ?? this.day,
      exercises: exercises ?? this.exercises,
    );
  }

  Map<String, dynamic> toMap() => {
    '_id': id,
    'name': name,
    'day': day,
    'exercises': exercises.map((e) => e.toMap()).toList(),
  };

  factory WorkoutModel.fromMap(Map<String, dynamic> map) => WorkoutModel(
    id: map['_id'],
    name: map['name'],
    day: map['day'],
    exercises: List<ExerciseModel>.from(
      map['exercises']?.map((x) => ExerciseModel.fromMap(x)),
    ),
  );
}
