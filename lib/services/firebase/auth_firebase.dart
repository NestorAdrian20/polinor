import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


FirebaseFirestore db = FirebaseFirestore.instance;

var acs = ActionCodeSettings(
    // URL you want to redirect back to. The domain (www.example.com) for this
    // URL must be whitelisted in the Firebase Console.
    url: 'https://www.example.com/finishSignUp?cartId=1234',
    // This must be true
    handleCodeInApp: true,
    iOSBundleId: 'com.example.ios',
    androidPackageName: 'com.example.android',
    // installIfNotAvailable
    androidInstallApp: true,
    // minimumVersion
    androidMinimumVersion: '12');

Future<void> addUser(emailAddress, password) async {
  
  try {
  
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailAddress,
    password: password,
  );
  User? user = userCredential.user;
  if (user != null) {
    // Autenticación exitosa
  }
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
}

//Guardar name firestore
Future<void> addUsers(
  /*
  "name": txtName.text,

      "mobile": txtMobile.text,
      "email": txtEmail.text,
      "address": txtAddress.text,
      "password": txtPassword.text,
      "push_token": "",
      "device_type": Platform.isAndroid ? "A" : "I"
  */
  String name,
  String mobile,
  String email,
  String address,
  String password,
) async {
   final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
  await db.collection('users').add({
    "name": name,
    "mobile": mobile,
    "email": email,
    "address": address,
    "password": password,
  });
}

Future<void> resetPassword(email) async {
  await FirebaseAuth.instance
    .sendPasswordResetEmail(email: email);
} 
