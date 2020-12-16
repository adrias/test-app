part of 'authBloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  
}

class Authenticated extends AuthState {}

class NotAuthenticated extends AuthState {}
