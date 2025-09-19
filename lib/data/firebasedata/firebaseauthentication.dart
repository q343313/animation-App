


import 'package:firebase_auth/firebase_auth.dart';
import 'package:messanger/data/firebasedata/firebaseservices.dart';

class FirebaseAuthentiction extends FirebaseServices{

  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  loginuser(String email, password)async{
   await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  logoutuser()async{
  await auth.signOut();
  }

  @override
  resetpassword(String email)async {
  await auth.sendPasswordResetEmail(email: email);
  }

  @override
  signupuseraccount(String email, password) async{
  UserCredential user = await auth.createUserWithEmailAndPassword(email: email, password: password);
  }
}