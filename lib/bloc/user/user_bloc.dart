import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_state_bloc/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    // Cuando se llama al evento se recibe aqui y se hace la funcion
    // que se le indique y entonces en base a el resultado se emite
    // un nuevo estado con la funcion emit
    on<ActivateUser>((event, emit) {});
  }
}
