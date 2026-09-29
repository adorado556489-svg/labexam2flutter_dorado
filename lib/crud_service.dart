import 'package:cloud_firestore/cloud_firestore.dart';

class CrudService {
  final CollectionReference _tasks =
      FirebaseFirestore.instance.collection('tasks');

  // CREATE
  Future<void> addTask(String title) {
    return _tasks.add({
      'title': title,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }


  Stream<QuerySnapshot> getTasks() {
    return _tasks.orderBy('createdAt', descending: false).snapshots();
  }

  // UPDATE
  Future<void> updateTask(String id, String newTitle) {
    return _tasks.doc(id).update({'title': newTitle});
  }

  // DELETE
  Future<void> deleteTask(String id) {
    return _tasks.doc(id).delete();
  }
}