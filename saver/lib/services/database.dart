import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final CollectionReference saverCollection=Firestore.instance.collection('saver');
  
}