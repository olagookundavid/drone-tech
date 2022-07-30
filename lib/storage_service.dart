import 'package:drone_app/firebase_crud.dart';

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
}
