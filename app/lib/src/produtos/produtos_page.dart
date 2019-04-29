import 'package:app/src/shared/models/produto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'produtos_bloc.dart';
import 'produto_view/produto_view_screen.dart';

class ProdutosPage extends StatefulWidget {
  @override
  _ProdutosPageState createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  final _bloc = ProdutosBloc();

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

  Widget _errorDialog(Object error) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.black26,
        ),
        SimpleDialog(
          children: <Widget>[
            Icon(Icons.error_outline),
            SizedBox(height: 20),
            Text(error, textAlign: TextAlign.center),
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: RaisedButton(
                child: Text("Recarregar"),
                onPressed: _bloc.refreshList,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _loadingScreen() {
    return Center(
      child: CircularProgressIndicator(),
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
          if (snapshot.hasError) return _errorDialog(snapshot.error);
          if (!snapshot.hasData) return _loadingScreen();

          List<Produto> produtos = snapshot.data;
          return ListView.builder(
            itemCount: produtos.length,
            itemBuilder: (context, index) {
              return _item(produtos[index]);
            },
          );
        },
      ),
      floatingActionButton: StreamBuilder<List<Produto>>(
        stream: _bloc.listOut,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FloatingActionButton(
              onPressed: () {
                //tela de pedidos
              },
              child: Icon(Icons.add_shopping_cart),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
