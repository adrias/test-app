import 'package:bloc/bloc.dart';
import 'package:parentive/Bloc/auth/authBloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parentive/api/loginHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'loginEvent.dart';
part 'loginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthBloc authBloc;
  LoginBloc({this.authBloc}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(event) async* {
    final pref = await SharedPreferences.getInstance();

    if (event is LoginPressed) {
      LoginHelper().login(
        event.email,
        event.password,
      );
      yield LoggedIn();
    } else if (event is LogoutPressed) {
      yield LoggedOut();
    }
  }
}
