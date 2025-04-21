import 'package:ecommerce_flutter/src/domain/useCases/Products/ProductsUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/product/list/bloc/ClienProductListState.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/product/list/bloc/ClientProductListEvent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientProductListBloc extends Bloc<ClientProductListEvent, ClientProductListState> {

  ProductsUseCases productsUseCases;

  ClientProductListBloc(this.productsUseCases): super(ClientProductListState()) {
    on<GetProductsByCategory>(_onGetProductsByCategory);
  }

  Future<void> _onGetProductsByCategory(GetProductsByCategory event, Emitter<ClientProductListState> emit) async {
    emit(
      state.copywith(
        response: Loading()
      )
    );
    Resource response = await productsUseCases.getProductsByCategory.run(event.idCategory);
    emit(
      state.copywith(
        response: response
      )
    );
  }

}
  
