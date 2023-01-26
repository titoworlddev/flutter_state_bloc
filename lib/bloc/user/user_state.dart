part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool existUser;
  final User? user;

  const UserState({
    this.existUser = false,
    this.user,
  });
}

// Cuando se crea el bloc se crea con el estado inicial
// que es el estado inicial de la clase UserState el cual especificamos aqui
class UserInitialState extends UserState {
  const UserInitialState() : super(existUser: false, user: null);
}

// Cuando se activa un usuario se crea un nuevo estado
// que es el estado de la clase UserState el cual especificamos aqui
class UserSetState extends UserState {
  final User newUser;

  const UserSetState(this.newUser) : super(existUser: true, user: newUser);
}
