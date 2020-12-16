part of 'loginBloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoginInitial extends LoginState {}

class LoggedIn extends LoginState {}

class LoggedOut extends LoginState {}
