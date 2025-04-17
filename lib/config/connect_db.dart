import 'package:mongo_dart/mongo_dart.dart';

class DBConnection {
  static const String connectionURL =
      'mongodb+srv://Rahul:rahul@cluster0.qk1mguz.mongodb.net/pg_tracker?retryWrites=true&w=majority';

  static Future<Db> connect() async {
    var db = await Db.create(connectionURL);
    await db.open();
    return db;
  }
}
