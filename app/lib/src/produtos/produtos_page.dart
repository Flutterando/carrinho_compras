import 'package:app/src/carrinho/carrinho_bloc.dart';
import 'package:app/src/shared/models/produto.dart';
import 'package:app/src/shared/widgets/loading_widget.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'produtos_bloc.dart';
import 'produto_view/produto_view_screen.dart';
import '../carrinho/carrinho_page.dart';

class ProdutosPage extends StatefulWidget {
  @override
  _ProdutosPageState createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  final _bloc = ProdutosBloc();

  CarrinhoBloc carrinhoBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    carrinhoBloc = BlocProviderList.of<CarrinhoBloc>(context);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  String _limitText(String text) {
    return text.substring(0, 30) + "...";
  }

  Widget _item(Produto produto) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) {
            return ProdutoViewScreen(produto: produto);
          }),
        );
      },
      leading: Container(
          width: 40,
          height: 40,
          child: Hero(
            child: Image.network(
              produto.image,
              fit: BoxFit.cover,
            ),
            tag: produto.id,
          )),
      title: Text(produto.title),
      subtitle: Text(_limitText(produto.description)),
      trailing: Text("\$ ${produto.price}"),
    );
  }

  Widget _erroScreen(String error) {
    return GestureDetector(
      onTap: _bloc.refreshList,
      child: Center(
        child: Column(
          children: <Widget>[
            Icon(Icons.error_outline),
            Container(
              height: 20,
            ),
            Text(error),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listagem de Produtos"),
      ),
      body: StreamBuilder<List<Produto>>(
        stream: _bloc.listOut,
        builder: (context, snapshot) {
          if (snapshot.hasError) return _erroScreen(snapshot.error);
          if (!snapshot.hasData) return LoadingWidget();

          List<Produto> produtos = snapshot.data;
          return ListView.builder(
            itemCount: produtos.length,
            itemBuilder: (context, index) {
              return _item(produtos[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => CarrinhoPage(),
            ),
          );
        },
        child: Container(
          child: Stack(
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.redAccent,
                maxRadius: 10,
                child: StreamBuilder<int>(
                    stream: carrinhoBloc.totalCarrinho,
                    builder: (context, snapshot) {
                      return Text(
                        "${snapshot.data ?? 0}",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      );
                    }),
              ),
              SizedBox(
                width: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}