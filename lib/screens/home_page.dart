import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drone_app/resource/add_dialog.dart';
import 'package:drone_app/network_repositories/storage_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Drones Delivery List'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: StorageService().getDroneDetailsStreams(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      final drone = snapshot.data?.docs[index];
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 5),
                        margin: const EdgeInsets.only(bottom: 2),
                        decoration: BoxDecoration(
                            color: Colors.lightBlueAccent,
                            border: Border.all(color: Colors.blue, width: 2)),
                        child: Column(
                          children: [
                            Text(
                              'ID : ${drone?['id']}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Weight Capacity: ${drone?['weightcap']}',
                                    style: const TextStyle(fontSize: 15)),
                                Text('Manufacturer: ${drone?['manufacturer']}',
                                    style: const TextStyle(fontSize: 15)),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Service Status: ${drone?['serviced']}',
                                    style: const TextStyle(fontSize: 15)),
                                Text('Date Acquired: ${drone?['dateacquired']}',
                                    style: const TextStyle(fontSize: 15)),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.lightBlueAccent,
                  ),
                );
              } else {
                return const Center(
                  child: Text('An Error Occured\n  No Data'),
                );
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        tooltip: 'Click to add drone',
        child: const Icon(Icons.add),
        onPressed: () {
          addNewDialog(context);
        },
      ),
    );
  }
}
