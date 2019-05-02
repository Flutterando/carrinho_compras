import 'package:app/src/login/auth_service.dart';
import 'package:app/src/shared/models/usuario.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class LoginBloc extends BlocBase {
  AuthService service;

  LoginBloc(this.service) {
    streamLoadingController.add(false);

    service.isLogged().then((logged) {
      streamIsLoggedController.add(logged);
      streamLoadingController.add(true);
    });
  }

  var streamIsLoggedController = BehaviorSubject<bool>();
  Observable<bool> get isLogged => streamIsLoggedController.stream;

  var streamLoadingController = BehaviorSubject<bool>();
  Observable<bool> get isLoading => streamLoadingController.stream;

  //Future<int> addUsuario(Usuario usuario) async => await service.add(usuario);

  _handleLogin() {}

  @override
  void dispose() {
    streamIsLoggedController.close();
  }
}
