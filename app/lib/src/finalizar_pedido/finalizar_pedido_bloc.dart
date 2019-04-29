
import 'package:rxdart/rxdart.dart';

class FinalizarPedidoBloc {

  final loadingController = BehaviorSubject<bool>.seeded(true);
  Observable<bool> get loadingFlux => loadingController?.stream?.distinct();
  Sink<bool> get loadingEvent => loadingController?.sink;

  void dispose() {
    loadingController.close();
  }

}