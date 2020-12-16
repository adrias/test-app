part of 'loginBloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginPressed extends LoginEvent {
  final String email;
  final String password;

  LoginPressed({this.email, this.password});
  @override
  // TODO: implement props
  List<Object> get props => [
        email,
        password,
      ];
}

class LogoutPressed extends LoginEvent {}
