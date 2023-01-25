part of 'user_bloc.dart';

@immutable
abstract class UseState {
  final bool existUser;
  final User? user;

  const UseState({
    this.existUser = false,
    this.user,
  });
}
