import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/useCases/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClientShoppingBagBloc extends Bloc<ClientShoppingBagEvent, ClientShoppingBagState> {

  ShoppingBagUseCases shoppingBagUseCases;

  ClientShoppingBagBloc(this.shoppingBagUseCases): super (ClientShoppingBagState()) {
    on<GetShoppingBag>(_onGetshoppingBag);
  }

  Future<void> _onGetshoppingBag(GetShoppingBag event, Emitter<ClientShoppingBagState> emit) async {

    List<Product> products = await shoppingBagUseCases.getProducts.run();
    emit(
      state.copyWith(products: products)
    );
  }
}