import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:pg_tracker/models/onboarding_model.dart';
import '../config/connect_db.dart';

class OnboardingMongoDBService {
  final connectionURL =
      'mongodb+srv://Rahul:rahul@cluster0.qk1mguz.mongodb.net/pg_tracker?retryWrites=true&w=majority';

  // GET DEVICE DETAILS HERE
  Future<String> getDeviceDetails() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String deviceId = '';

    // Check if it's an iOS or Android device
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor ?? "Unknown";
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id;
    } else {
      deviceId = "Unknown";
    }

    return deviceId;
  }

  Future<bool> getOnboardingStatus() async {
    String deviceId = await getDeviceDetails();
    print("Device ID: $deviceId");
    var db = await DBConnection.connect();

    var collection = db.collection('onboarding');
    var result = await collection.findOne(where.eq('deviceId', deviceId));
    print("Result111111111111111111111: $result");
  if (result != null) {
      print("Onboarding data found for device ID: $deviceId");
      return true;
    } else {
      print("No onboarding data found for device ID: $deviceId");
      return false;
    }
  }

  Future<Map<String, dynamic>> saveOnboardingData(
    ExerciseModel onboardingData,
  ) async {
    try {
      String deviceId = await getDeviceDetails();
      print("Device ID hereeeeee: $deviceId");
      var db = await DBConnection.connect();
      var collection = db.collection('onboarding');
      final uploadedData = onboardingData.copyWith(deviceId: deviceId);
      await collection.insertOne(uploadedData.toMap());
      return {'success': true, 'data': uploadedData.toMap()};
    } catch (e) {
      print("Error saving onboarding data: $e");
      return {'success': false, 'error': e.toString()};
    }
  }
}
