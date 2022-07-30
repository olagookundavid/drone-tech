import 'package:cloud_firestore/cloud_firestore.dart';

//Class connecting with firebase
class CrudMethods {
  final _firestore = FirebaseFirestore.instance;
  Future<void> addData(
      id, weightcap, manufacturer, serviced, dateacquired) async {
    await _firestore.collection('drones').add({
      'id': id,
      'weightcap': weightcap,
      'manufacturer': manufacturer,
      'serviced': serviced,
      'dateacquired': dateacquired,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getMessageStreams() {
    return _firestore
        .collection('drones')
        .orderBy(
          'timestamp',
          descending: false,
        )
        .snapshots();
  }
}
