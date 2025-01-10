import 'package:cloud_firestore/cloud_firestore.dart';

class DBService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Get all tasks
  Stream<List<Map<String, dynamic>>> getTasks() {
    return _db.collection('tasks').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => {...doc.data(), 'id': doc.id}).toList());
  }

  // Add new task
  Future<void> addTask(String name) async {
    await _db.collection('tasks').add({'name': name});
  }

  // Update task
  Future<void> updateTask(String id, String name) async {
    await _db.collection('tasks').doc(id).update({'name': name});
  }

  // Delete task
  Future<void> deleteTask(String id) async {
    await _db.collection('tasks').doc(id).delete();
  }
}
