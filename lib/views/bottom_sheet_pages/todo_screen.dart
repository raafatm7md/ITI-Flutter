import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  CollectionReference tasksDoc = FirebaseFirestore.instance.collection('tasks');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<QuerySnapshot<Object?>>(
        future: tasksDoc.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData == false && snapshot.data == null) {
            return const Center(child: CircularProgressIndicator(color: Colors.lightBlue));
          }
          print(snapshot.connectionState.toString());
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text(
                    "${snapshot.data!.docs[index]['name']}",
                  ),
                    title: Padding(
                      padding: const EdgeInsets.only(left: 110),
                      child: Text(
                        "${snapshot.data!.docs[index]['description']}",
                      ),
                    )
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator(color: Colors.lightBlue));
        },
      ),
    );
  }
}
