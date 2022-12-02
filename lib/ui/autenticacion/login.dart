import 'package:chat_firebase/domain/controller/controluser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController passw = TextEditingController();
  ControlAuthFirebase ca = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Ingrese al chat'),
              const SizedBox(
                height: 20,
              ),
              const CircleAvatar(
                radius: 40,
                child: Icon(
                  Icons.message_outlined,
                  size: 40,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: email,
                decoration:
                    const InputDecoration(labelText: 'Ingrese el Email'),
              ),
              TextField(
                controller: passw,
                obscureText: true,
                decoration:
                    const InputDecoration(labelText: 'Ingrese la Constraseña'),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      ca.ingresarEmail(email.text, passw.text).then((value) {
                        if (ca.emailf != "") {
                          Get.offAllNamed("/salachat");
                        } else {
                          Get.showSnackbar(const GetSnackBar(
                            title: 'Validacion de Usuarios',
                            message: 'Usuario o Contraseña Invalidos',
                            icon: Icon(Icons.warning),
                            duration: Duration(seconds: 5),
                            backgroundColor: Colors.red,
                          ));
                        }
                      });
                    },
                    child: const Text('Login'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ca.registrarEmail(email.text, passw.text).then((value) {
                        if (ca.emailf != "") {
                          Get.offAllNamed("/salachat");
                        } else {
                          Get.showSnackbar(const GetSnackBar(
                            title: 'Validacion de Usuarios',
                            message: 'Usuario o Contraseña Invalidos',
                            icon: Icon(Icons.warning),
                            duration: Duration(seconds: 5),
                            backgroundColor: Colors.red,
                          ));
                        }
                      }).catchError((e) {
                        Get.showSnackbar(GetSnackBar(
                          title: 'Validacion de Usuarios',
                          message: '$e',
                          icon: const Icon(Icons.warning),
                          duration: const Duration(seconds: 5),
                          backgroundColor: Colors.red,
                        ));
                      });
                    },
                    child: const Text('Registrarse'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
