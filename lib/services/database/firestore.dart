import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirestoreService {
  //get collection dari order
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  //simpan ke database
  Future<void> saveOrderToDatabase(String receipt) async {
    await orders.add({
      'tanggal': DateTime.now(),
      'nota': receipt,
    });
  }

  //get collection dari order
  final CollectionReference cart =
      FirebaseFirestore.instance.collection('cart');

  //simpan ke database
  Future<void> savecartoDatabase(String nama, int jumlah) async {
    await cart.add({
      'nama': nama,
      'jumlah': jumlah,
    });
  }
}
