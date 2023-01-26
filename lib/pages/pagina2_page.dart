import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            color: Colors.blue,
            onPressed: () {},
            child: const Text('Establecer Usuario',
                style: TextStyle(color: Colors.white)),
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {},
            child: const Text('Cambiar Edad',
                style: TextStyle(color: Colors.white)),
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {},
            child: const Text('Añadir Profesion',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      )),
    );
  }
}
