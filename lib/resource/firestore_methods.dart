import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventry/models/firebase/user_model.dart';
import 'package:eventry/resource/hive_repository.dart';
import 'package:eventry/config/config.dart';

class FirestoreMethods {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference _userCollectionRef;
  late CollectionReference _eventCategoriesCollectionRef;

  Stream get allEventsCategories => _eventCategoriesCollectionRef.orderBy('name').snapshots();

  FirestoreMethods() {
    _userCollectionRef = _firebaseFirestore.collection(userCollectionName);
    _eventCategoriesCollectionRef = _firebaseFirestore.collection(eventCategoriesCollectionName);
  }


  Future<void> addUser(UserModel user) async {
    try {
      await _userCollectionRef.doc(user.uid).set(user.toJson());
    } catch(_) {}
  }

  Future<void> getUser(String uid) async {
    try {
      final response = await _userCollectionRef.doc(uid).get();
      final data = response.data() as Map<String, dynamic>;
      await HiveRepository().saveUserData(UserModel.fromJson(data));
    } catch(_) {}
  }

}
