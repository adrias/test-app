part of 'regBloc.dart';

class RegState extends Equatable {
  const RegState();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class RegInitial extends RegState {}

class RegOnProcess extends RegState {}

class Registered extends RegState {}

class NotRegistered extends RegState {}
