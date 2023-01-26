import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_bloc/bloc/user/user_bloc.dart';
import 'package:flutter_state_bloc/models/user.dart';

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
            onPressed: () {
              final newUser = User(
                nombre: 'Juan',
                edad: 30,
                profesiones: ['FullStack Developer'],
              );
              // Tengo que hacer llamar al bloc para poder emitir un evento
              // listen: false para que no se reconstruya el widget
              // porque el widget se reconstruye si cuando llamo al evento
              // le digo que se reconstruya con la funcion emit
              // aunque listen se supone que por defecto es false,
              // lo pongo por si acaso
              // Hay que decirle tambien que tipo de bloc <UserBloc>
              // porque es posible que haya mas de un bloc en la app
              // y para llamar al evento se usa .add, no se puede cambiar
              // directamente user.existUser = true por ejemplo, eso se hace
              // desde el bloc con la funcion emit
              BlocProvider.of<UserBloc>(context, listen: false)
                  .add(ActivateUser(newUser));
            },
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
