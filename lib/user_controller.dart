import 'package:cloud_firestore/cloud_firestore.dart';
import '../firestore_service.dart';

class UserController {
  final FirestoreService _firestoreService = FirestoreService();
  // Stream Users
  Stream<QuerySnapshot> streamUsers() {
    return _firestoreService.getUsers();
  }

  // Create User
  Future<void> createUser(String name, int age) async {
    try {
      await _firestoreService.addUser(name, age);
    } catch (e) {
      print('Error creating user: $e');
      rethrow;
    }
  }

  // Update User
  Future<void> updateUser(String id, String name, int age) async {
    try {
      await _firestoreService.updateUser(id, name, age);
    } catch (e) {
      print('Error updating user: $e');
      rethrow;
    }
  }

  // Delete User
  Future<void> deleteUser(String id) async {
    try {
      await _firestoreService.deleteUser(id);
    } catch (e) {
      print('Error deleting user: $e');
      rethrow;
    }
  }
}
