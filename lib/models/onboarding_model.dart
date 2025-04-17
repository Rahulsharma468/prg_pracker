class ExerciseModel {
  final String? id;
  final String? deviceId;
  final String name;
  final String weight;
  final String height;
  final double age;
  final double bodyFatPercentage;

  ExerciseModel({
    this.id,
    required this.name,
    this.deviceId,
    required this.weight,
    required this.height,
    required this.age,
    required this.bodyFatPercentage,
  });

  Map<String, dynamic> toMap() {
    return {
      "_id": id,
      "name": name,
      "weight": weight,
      "deviceId": deviceId,
      "height": height,
      "age": age,
      "bodyFatPercentage": bodyFatPercentage,
    };
  }

  ExerciseModel copyWith({
    String? id,
    String? name,
    String? deviceId,
    String? weight,
    String? height,
    double? age,
    double? bodyFatPercentage,
  }) {
    return ExerciseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      deviceId: deviceId ?? this.deviceId,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      age: age ?? this.age,
      bodyFatPercentage: bodyFatPercentage ?? this.bodyFatPercentage,
    );
  }

  factory ExerciseModel.fromMap(Map<String, dynamic> map) {
    return ExerciseModel(
      id: map["_id"] ?? "",
      name: map["name"] ?? "",
      weight: map["weight"] ?? "",
      deviceId: map["device_id"] ?? "",
      height: map["height"] ?? "",
      age: map["age"]?.toDouble() ?? 0.0,
      bodyFatPercentage: map["bodyFatPercentage"]?.toDouble() ?? 0.0,
    );
  }
}
