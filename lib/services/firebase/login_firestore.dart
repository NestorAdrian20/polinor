//import 'dart:ffi';

//import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getProducts() async {
  List products = [];
  CollectionReference collectionReferencePeople = db.collection('products');
  QuerySnapshot querySnapshot = await collectionReferencePeople.get();

  for (var doc in querySnapshot.docs) {
    final data = doc.data() as Map<String, dynamic>;
    final product = {
      
      "uid": doc.id,
      "name": data['name']
    };
    products.add(product);
  }

  return products;
}

Future<void> addCategoria(String name, String description) async {
  await db
      .collection('services')
      .doc('szVtg3W6iBuu7Vx0HxVy')
      .collection('categories')
      .add({
    "name": name,
    "description": description,
    "state": "inactivo",
  });
}

//Actualizar datos de firebase
Future<void> updateServicio(String uid, String nuevoNombre) async {
  await db.collection('servicio').doc(uid).set({"nombre": nuevoNombre});
}

//Borrar datos de firebase
Future<void> deletePeople(String uid) async {  
  await db.collection('servicio').doc(uid).delete();
}
