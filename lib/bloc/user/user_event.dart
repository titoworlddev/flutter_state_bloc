part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivarUsuario extends UserEvent {
  final User user;
  ActivarUsuario(this.user);
}
