import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe/blocs/auth_event.dart';
import 'package:pfe/blocs/auth_state.dart';
import 'package:pfe/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  AuthRepository authRepository;
  AuthBloc(AuthState initialState, this.authRepository) : super(initialState);

  @override
  Stream<AuthState> mapEventToState(AuthEvents event) async* {
    print('########################## 2');
    if (event is StartEvent) {
      yield LoginInitState();
    } else if (event is LoginSubmit) {
      yield LoginLoadingState();
      print('########################## 3');

      var data = await authRepository.login(event.username, event.password);
      if (data != null) {
        if (data['access'] != null || data['refresh'] != null) {
          SharedPreferences.setMockInitialValues({});
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('access', data['access']);
          prefs.setString('refresh', data['refresh']);
          yield PatientSuccessLoginState();
        }
      } else {
        yield LoginErrorState(message: " the credentials are incorect");
      }
    }
  }
}
