import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestion_commercial/main.dart';

class Recuperer extends StatefulWidget {
  const Recuperer({Key? key}) : super(key: key);
  @override
  RetourRecupererState createState() => RetourRecupererState();
}

class RetourRecupererState extends State<Recuperer> {
  final Stream<QuerySnapshot> Afficher =
      FirebaseFirestore.instance.collection('Articles').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Afficher,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          print('myString');
          return CircularProgressIndicator();
        }

        return Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                        label: Text('Name',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ))),
                    DataColumn(
                        label: Text('Age',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ))),
                    DataColumn(
                        label: Text('Gender',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ))),
                    DataColumn(
                        label: Text('Birthday',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ))),
                    DataColumn(
                        label: Text('Phone Number',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ))),
                    DataColumn(
                        label: Text('Triage Result',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ))),
                    DataColumn(
                        label: Text('Full Information',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ))),
                  ],
                  rows: snapshot.data!.docs.map((DocumentSnapshot doc) {
                    final rowData = doc.data() as Map<String, dynamic>;

                    // Return the corresponding string based on the value of "Triage Result"
                    String triageResult = rowData['triage_result'].toString();
                    List<String> listSymptoms =
                        List<String>.from(rowData['Symptoms']);

                    if (rowData['triage_result'] == 'A') {
                      triageResult = 'Emergency Case';
                      //print(triageResult);
                    } else if (rowData['triage_result'] == 'B') {
                      triageResult = 'Priority Case';
                    } else if (rowData['triage_result'] == 'C') {
                      triageResult = 'Non-urgent Case';
                    }

                    // create view button widget
                    final viewButton = Afficher(
                        context, rowData, doc, triageResult, listSymptoms);

                    return DataRow(cells: [
                      DataCell(Center(child: Text(rowData['Name']))),
                      DataCell(Center(child: Text(rowData['Age'].toString()))),
                      DataCell(Center(child: Text(rowData['Sex']))),
                      DataCell(Center(child: Text(rowData['Birthday']))),
                      DataCell(Center(child: Text(rowData['Contact Number']))),
                      DataCell(Center(child: Text(triageResult))),
                      DataCell(Center(child: viewButton)),
                    ]);
                  }).toList(), //.sublist(0, numberOfRows),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('5'),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('10'),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('All'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
