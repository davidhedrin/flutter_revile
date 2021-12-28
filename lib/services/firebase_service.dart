import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService{
  CollectionReference homebanner = FirebaseFirestore.instance.collection('homeBanner');
  CollectionReference brands = FirebaseFirestore.instance.collection('brands');
}