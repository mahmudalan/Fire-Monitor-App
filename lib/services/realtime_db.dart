import 'package:firebase_database/firebase_database.dart';

//buat nyimpen nama-nama sensor di firebase
final database = FirebaseDatabase.instance.ref();
final dataApi = database.child('dataApi');
final dataAsap = database.child('dataAsap');
final dataSuhu = database.child('dataSuhu');
