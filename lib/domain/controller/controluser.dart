import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ControlAuthFirebase extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Rx<dynamic> _uid = "".obs;
  final Rx<dynamic> _usuarior = "".obs;
  final Rx<dynamic> _mensajes = "".obs;

  String get emailf => _usuarior.value;
  String get uid => _uid.value;

  Future<void> reiniciar() async {
    _usuarior.value = "";
    _usuarior.refresh();
  }

  Future<void> registrarEmail(String email, String passwd) async {
    try {
      UserCredential usuario = await auth.createUserWithEmailAndPassword(
          email: email, password: passwd);

      print(usuario);

      _uid.value = usuario.user!.uid;
      _usuarior.value = usuario.user!.email;
    } on FirebaseException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('Contraseña debil');
      } else if (e.code == 'email-already-in-use') {
        return Future.error('Email ya está en uso');
      }
    }
  }

  Future<void> ingresarEmail(String u, String p) async {
    try {
      UserCredential usuario =
          await auth.signInWithEmailAndPassword(email: u, password: p);
      _uid.value = usuario.user!.uid;
      _usuarior.value = usuario.user!.email;
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error('Usuario no encontrado');
      } else if (e.code == 'wrong-password') {
        return Future.error('Contraseña incorrecta');
      }
    }
  }
}
