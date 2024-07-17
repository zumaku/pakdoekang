import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

class AppService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  CollectionReference get transactions => _db.collection('app');

  Stream<String?> get getAboutLinks {
    return transactions.doc('about_links').snapshots().map((snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>?;
        return jsonEncode(data);
      } else {
        print('Document does not exist');
        return null;
      }
    }).handleError((error) {
      print('Error getting document: $error');
      return null;
    });
  }
}
