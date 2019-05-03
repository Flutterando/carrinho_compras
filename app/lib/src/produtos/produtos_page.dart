import 'package:app/src/carrinho/carrinho_bloc.dart';
import 'package:app/src/shared/models/produto.dart';
import 'package:app/src/shared/widgets/loading_widget.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'produtos_bloc.dart';
import 'detalhes/detalhes_screen.dart';
import '../carrinho/carrinho_page.dart';

class ProdutosPage extends StatefulWidget {
  @override
  _ProdutosPageState createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  
  final _bloc = BlocProvider.getBloc<ProdutosBloc>();
  final _carrinhoBloc = BlocProvider.getBloc<CarrinhoBloc>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  

  String _limitText(String text) {
    return text.substring(0, 30) + "...";
  }

  Widget _item(Produto produto) {
    return ListTile(
      onTap: () async {
        var v = await Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) {
            return DetalhesScreen(produto: produto);
          }),
        );

        if(v != null){
          scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content: Text("Item adicionado ao carrinho!"),
                ),
              );
        }
          
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Listagem de Produtos"),
      ),
      body: StreamBuilder<List<Produto>>(
        stream: _bloc.listOut,
        builder: (context, snapshot) {
          if (snapshot.hasError) return _errorDialog(snapshot.error);
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
                    stream: _carrinhoBloc.totalCarrinho,
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
