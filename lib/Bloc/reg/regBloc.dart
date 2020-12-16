import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parentive/api/loginHelper.dart';

part 'regEvent.dart';
part 'regState.dart';

class RegBloc extends Bloc<RegEvent, RegState> {
  RegBloc(RegState initialState) : super(initialState);

  

  @override
  Stream<RegState> mapEventToState(RegEvent event) async* {
    if (event is RegPressed) {
      LoginHelper().register(
        event.name,
        event.email,
        event.password,
      );
    } else {
      yield NotRegistered();
    }
  }
}
