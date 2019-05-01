import 'package:app/src/shared/repositories/general_api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:app/src/shared/models/produto.dart';

class ProdutosBloc extends BlocBase {
  final GeneralApi api;

  ProdutosBloc(this.api);

  final BehaviorSubject _listController = BehaviorSubject.seeded(true);
  Observable<List<Produto>> get listOut =>
      _listController.stream.asyncMap((v) => api.getProducts());

  refreshList() {
    _listController.add(true);
  }

  dispose() {
    _listController.close();
  }
}
