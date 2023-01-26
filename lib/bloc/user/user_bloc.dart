import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import 'package:flutter_state_bloc/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    // Cuando se llama al evento se recibe aqui y se hace la funcion
    // que se le indique y entonces en base a el resultado se emite
    // un nuevo estado con la funcion emit
    on<ActivateUser>((event, emit) => emit(UserSetState(event.user)));
    on<ChangeUserAge>((event, emit) {
      // Tengo acceso al state porque estoy extendiendo de bloc y ahi hago acceso al UserState
      // se podria hacer asi
      // state.user!.edad = event.age;
      // pero eso esta mutando el estado y eso no se debe hacer
      // es como el state de React, hay que mandarle un nuevo estado
      if (state.existUser) {
        emit(UserSetState(state.user!.copyWith(edad: event.age)));
      }
    });

    on<AddUserProfession>((event, emit) {
      if (state.existUser) {
        List<String> profesiones = [
          ...state.user!.profesiones,
          event.profesion
        ];
        // Tambien se puede hacer asi
        // List<String> profesiones = List.from(state.user!.profesiones);
        // profesiones.add(event.profesion);
        // Lo hagas como lo hagas se trata de hacer una nueva copia de las profesiones para evitar mutar el estado y en su lugar enviar uno nuevo

        // Aqui ya cambiamos el estado
        emit(UserSetState(state.user!.copyWith(profesiones: profesiones)));

        // Se usa el copyWtih para evitar enviar siempre un usuario nuevo, teniendo que rellenar siempre sus propiedas como aqui. Mejor enviamos una copia y cambiamos lo que queremos que cambie en el estado
        // emit(UserSetState(User(
        //   edad: state.user!.edad,
        //   nombre: state.user!.nombre,
        //   profesiones: profesiones,
        // )));
      }
    });
  }
}
