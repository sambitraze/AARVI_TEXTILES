import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static bool isLoggedIn = false;
  Future signIn(String email,String pass) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: pass);
      FirebaseUser user = result.user;
      print("Logged In");
      return user;
    }catch(e){
      print(e.toString());
    }
  }
  //registr new worker
  Future regsiter(String email,String pass) async {

  }

  // worker stream to list all worker
}