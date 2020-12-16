part of 'authBloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class UserCheck extends AuthEvent {}

class UserExits extends AuthEvent {}

class UserDoesNotExites extends AuthEvent {}
