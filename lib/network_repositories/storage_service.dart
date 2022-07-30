import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drone_app/network_services/firebase_crud.dart';

//Repository to create an abstract layer
class StorageService {
  CrudMethods crudMethods = CrudMethods();
  Future<void> addDrone(
    id,
    weightcap,
    manufacturer,
    serviced,
    dateacquired,
  ) async {
    await crudMethods.addData(
      id,
      weightcap,
      manufacturer,
      serviced,
      dateacquired,
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getDroneDetailsStreams() {
    return crudMethods.getDroneStreams();
  }
}
