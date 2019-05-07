import 'package:app/src/carrinho/carrinho_bloc.dart';
import 'package:app/src/shared/models/produto.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group("Bloc Carrinho", () {
    var bloc = CarrinhoBloc();
    test('add product', () async {
      var produto = Produto(id: "1");
      bloc.addItemCarrinho.add(produto);
      await Future.delayed(Duration(milliseconds: 1));
      expect(bloc.produtosCarrinho, emits([produto]));




    });
    test('Total Products', () async {
      expect(bloc.totalCarrinho, emits(1));
    });
  });
}
