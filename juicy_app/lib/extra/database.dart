import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference usersDb = FirebaseFirestore.instance.collection('users');
CollectionReference productsDb = FirebaseFirestore.instance.collection('products');