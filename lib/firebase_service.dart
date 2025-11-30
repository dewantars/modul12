import 'package:cloud_firestore/cloud_firestore.dart';

class ApiService {
  static final CollectionReference _items = FirebaseFirestore.instance
      .collection('items');
  // FETCH ALL ITEMS
  static Future<List<Map<String, dynamic>>> fetchItems() async {
    try {
      QuerySnapshot snapshot = await _items
          .orderBy('createdAt', descending: true)
          .get();
      return snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'title': doc['title'] ?? '',
          'desc': doc['desc'] ?? '',
          'createdAt': (doc['createdAt'] as Timestamp).toDate().toString(),
        };
      }).toList();
    } catch (e) {
      print('Error fetching items: $e');
      return [];
    }
  }

  // CREATE ITEM
  static Future<void> createItem(String title, String desc) async {
    try {
      await _items.add({
        'title': title,
        'desc': desc,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error creating item: $e');
    }
  }

  // UPDATE ITEM
  static Future<void> updateItem(String id, String title, String desc) async {
    try {
      await _items.doc(id).update({'title': title, 'desc': desc});
    } catch (e) {
      print('Error updating item: $e');
    }
  }

  // DELETE ITEM
  static Future<void> deleteItem(String id) async {
    try {
      await _items.doc(id).delete();
    } catch (e) {
      print('Error deleting item: $e');
    }
  }
}
