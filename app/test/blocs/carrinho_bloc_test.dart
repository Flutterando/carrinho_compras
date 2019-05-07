import 'package:app/src/carrinho/carrinho_bloc.dart';
import 'package:app/src/shared/models/produto.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  CarrinhoBloc bloc = CarrinhoBloc();
  Produto produto = Produto(id: "1");
  group("Bloc Carrinho", () {
    test('add product', () async {
      bloc.addItemCarrinho.add(produto);
      await Future.delayed(Duration(milliseconds: 5));
      expect(bloc.produtosCarrinho, emits([produto]));
    });
    test('total product', () async {
       expect(bloc.totalCarrinho, emits(1));
    });
    test('Remove product', () async {
      bloc.removeItemCarrinho.add(produto);
      await Future.delayed(Duration(milliseconds: 5));
      expect(bloc.totalCarrinho, emits(0));
    });
  });
}
