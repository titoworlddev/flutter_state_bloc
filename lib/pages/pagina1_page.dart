import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_state_bloc/bloc/user/user_bloc.dart';
import 'package:flutter_state_bloc/models/user.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<UserBloc>(context).add(DeleteUser());
            },
            icon: const Icon(Icons.delete_outline_rounded),
          )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        // Se puede usar el buildWhen para que solo se reconstruya
        // cuando se cumpla la condicion (tipo lazy load)
        // buildWhen: ,
        builder: (context, state) {
          return state.existUser
              ? InformacionUsuario(user: state.user!)
              : const Center(
                  child: Text('No hay usuario seleccionado'),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.accessibility_new),
          onPressed: () => Navigator.pushNamed(context, 'pagina2')),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final User user;

  const InformacionUsuario({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(title: Text('Nombre: ${user.nombre}')),
          ListTile(title: Text('Edad: ${user.edad}')),
          const Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          Expanded(
            child: ListView(
              children: [
                ...user.profesiones
                    .map((profesion) => ListTile(title: Text(profesion)))
              ],
            ),
          ),

          // Otra forma de hacer lo mismo que el codigo de arriba para agregar cada profesion seria
          // ...List.generate(
          //   user.profesiones!.length,
          //   (index) => ListTile(title: Text(user.profesiones![index])),
          // )
        ],
      ),
    );
  }
}
