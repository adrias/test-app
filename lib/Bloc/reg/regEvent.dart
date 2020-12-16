part of 'regBloc.dart';

class RegEvent extends Equatable {
  const RegEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class RegPressed extends RegEvent {
  final String email;
  final String password;
  final String name;

  RegPressed({this.email, this.password, this.name});
  @override
  List<Object> get props => [
        email,
        password,
        name,
      ];
}
