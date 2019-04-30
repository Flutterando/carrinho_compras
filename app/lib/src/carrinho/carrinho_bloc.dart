import 'package:app/src/shared/models/produto.dart';
import 'package:rxdart/rxdart.dart';

class CarrinhoBloc {
  List<Produto> _listaProdutos;

  trucateList() {
    _listaProdutos.clear();
    _produtosCarrinhoController.add([]);
  }

  var _produtosCarrinhoController = BehaviorSubject.seeded(<Produto>[]);
  Observable<List<Produto>> get produtosCarrinho =>
      _produtosCarrinhoController.stream;

  Observable<int> get totalCarrinho => _totalCarrinhoController.stream;

  var _addItemCarrinhoController = BehaviorSubject<Produto>();
  Sink<Produto> get addItemCarrinho => _addItemCarrinhoController.sink;

  var _removeItemCarrinhoController = BehaviorSubject<Produto>();
  Sink<Produto> get removeItemCarrinho => _removeItemCarrinhoController.sink;

  var _totalCarrinhoController = BehaviorSubject<int>();

  _handleAddItemCarrinho(Produto produto) {
    _listaProdutos.add(produto);
    _produtosCarrinhoController.add(_listaProdutos);
  }

  _handleRemoveItemCarrinho(Produto produto) {
    _listaProdutos.remove(produto);
    _produtosCarrinhoController.add(_listaProdutos);
  }

  CarrinhoBloc() {
    _listaProdutos = List<Produto>();
    _addItemCarrinhoController.listen(_handleAddItemCarrinho);
    _removeItemCarrinhoController.listen(_handleRemoveItemCarrinho);

    _produtosCarrinhoController
        .listen((lista) => _totalCarrinhoController.add(lista.length));
  }

  void dispose() {
    _produtosCarrinhoController.close();
    _totalCarrinhoController.close();
  }
}
