import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference users = FirebaseFirestore.instance.collection(
    'users',
  );
  // CREATE
  Future<void> addUser(String name, int age) {
    return users.add({'name': name, 'age': age});
  }

  // READ (real-time)
  Stream<QuerySnapshot> getUsers() {
    return users.snapshots();
  }

  // UPDATE
  Future<void> updateUser(String id, String name, int age) {
    return users.doc(id).update({'name': name, 'age': age});
  }

  // DELETE
  Future<void> deleteUser(String id) {
    return users.doc(id).delete();
  }
}
