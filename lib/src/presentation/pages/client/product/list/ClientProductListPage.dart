import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/product/list/ClientProductListItem.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/product/list/bloc/ClienProductListState.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/product/list/bloc/ClientProductListBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/product/list/bloc/ClientProductListEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ClientProductListPage extends StatefulWidget{
  const ClientProductListPage({super.key});

  @override
  State <ClientProductListPage> createState ()=> _ClientProductListPage();

}
class _ClientProductListPage extends State<ClientProductListPage>{

  ClientProductListBloc? _bloc;
  Category? category;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (category != null) {
        _bloc?.add(GetProductsByCategory(idCategory: category!.id!));
      }      
    });
  }

  @override
  Widget build(BuildContext context){

    //category = ModalRoute.of(context)?.settings.arguments as Category;

      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is Category) {
        category = args;
      } else {
        category = null; // O un valor por defecto
      }

      _bloc = BlocProvider.of<ClientProductListBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: BlocListener<ClientProductListBloc, ClientProductListState>(
          listener: (context, state) {
           final responseState = state.response;
           if(responseState is Success){
             if (responseState.data is bool){
               _bloc?.add(GetProductsByCategory(idCategory: category!.id!));
             }
           }
           if (responseState is Error) {
             Fluttertoast.showToast(msg: responseState.message, toastLength: Toast.LENGTH_LONG);
           }
         },
         child:  BlocBuilder<ClientProductListBloc, ClientProductListState>(
          builder: (context,state){
            final responseState= state.response;
            if(responseState is Success){
              List <Product> products = responseState.data as List<Product>;
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context,index){
                  return ClientProductListItem(_bloc,products[index]);
                }              
              );
            }
            return Container();
          },
        )
      )
    );
  }
}