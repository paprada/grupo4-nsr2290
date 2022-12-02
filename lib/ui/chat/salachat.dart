import 'package:chat_firebase/domain/controller/controlchat.dart';
import 'package:chat_firebase/domain/controller/controluser.dart';
import 'package:chat_firebase/ui/chat/mensajes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

//final mensaje = TextEditingController();
//ControlAuthFirebase cu = Get.find();
//final fire = FirebaseFirestore.instance;

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    TextEditingController mensaje = TextEditingController();
    ControlAuth ca = Get.find();
    ControlChat cc = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenido al chat ${ca.emailr}"),
        actions: [
          IconButton(
              onPressed: () {
                ca.reiniciar().then((value) => Get.offAllNamed("/login"));
              },
              icon: const Icon(Icons.exit_to_app_rounded))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Expanded(child: Mensaje()),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: mensaje,
                    decoration:
                        const InputDecoration(hintText: 'Ingrese un mensaje'),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      if (mensaje.text.isNotEmpty) {
                        final datos = {
                          'email': ca.emailr,
                          'fecha': DateTime.now(),
                          'mensaje': mensaje.text
                        };
                        cc.crearchat(datos);
                        mensaje.clear();
                      }
                    },
                    icon: const Icon(Icons.send))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
