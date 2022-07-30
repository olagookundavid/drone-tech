// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:drone_app/add_dialog.dart';
// import 'package:drone_app/firebase_crud.dart';
// import 'package:flutter/material.dart';


// StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//             stream: crudMethods.getMessageStreams(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Expanded(
//                   child: ListView.builder(
//                     itemCount: snapshot.data?.docs.length,
//                     itemBuilder: (context, index) {
//                       final drone = snapshot.data?.docs[index];
//                       return Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 6, vertical: 5),
//                         margin: const EdgeInsets.only(bottom: 2),
//                         decoration: BoxDecoration(
//                             color: Colors.lightBlueAccent,
//                             border: Border.all(color: Colors.blue, width: 2)),
//                         child: Column(
//                           children: [
//                             Text(
//                               'ID : ${drone?['id']}',
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 20),
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text('Weight Capacity: ${drone?['weightcap']}',
//                                     style: const TextStyle(fontSize: 15)),
//                                 Text('Manufacturer: ${drone?['manufacturer']}',
//                                     style: const TextStyle(fontSize: 15)),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text('Service Status: ${drone?['serviced']}',
//                                     style: const TextStyle(fontSize: 15)),
//                                 Text('Date Acquired: ${drone?['dateacquired']}',
//                                     style: const TextStyle(fontSize: 15)),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               } else if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(
//                   child: CircularProgressIndicator(
//                     backgroundColor: Colors.lightBlueAccent,
//                   ),
//                 );
//               } else {
//                 return const Center(
//                   child: Text('An Error Occured\n  No Data'),
//                 );
//               }
//             },
//           ),