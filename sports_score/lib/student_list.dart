import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  
  Future<void> dataFeaatch() async {
    
    final QuerySnapshot result = await FirebaseFirestore.instance.collection('students').get();
    print(result.docs.length);
    
    for(QueryDocumentSnapshot element in result.docs){
      print(element.data());
      print(element.get('name'));
    }
  }
 
 void initState() {
    super.initState();
    dataFeaatch();
  }
  @override
  Widget build(BuildContext context) {
    
     return Scaffold(
        appBar: AppBar(
          title: const Text('Student List'),
        ),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Student Name'),
              subtitle: Text('Student ID'),
             
            );
          },),
        
       
     );
  }
}
