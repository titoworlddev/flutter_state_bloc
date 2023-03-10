part of 'user_bloc.dart';

// La classe UserEvent se usa para definir que tipos de eventos
// se pueden emitir en el bloc, asi cada evento extiende de UserEvent
// y se define el tipo de evento que se va a emitir
@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent {
  final User user;
  ActivateUser(this.user);
}

class ChangeUserAge extends UserEvent {
  final int age;
  ChangeUserAge(this.age);
}

class AddUserProfession extends UserEvent {
  final String profesion;
  AddUserProfession(this.profesion);
}

class DeleteUser extends UserEvent {}
