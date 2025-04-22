import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/useCases/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/product/detail/bloc/ClientProductDetailEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/product/detail/bloc/ClientProductDetailState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class   ClientProductDetailBloc extends Bloc<ClientProductDetailEvent, ClientProductDetailState> {

  ShoppingBagUseCases shoppingBagUseCases;

  ClientProductDetailBloc(this.shoppingBagUseCases): super(ClientProductDetailState()) {
    on<GetProducts>(_onGetProducts);
    on<AddItem>(_onAddItem);
    on<SubtractItem>(_onSubtractItem);
    on<AddProductToShoppingBag>(_onAddProductToShoppingBag);
  }

  Future<void> _onGetProducts(GetProducts event, Emitter<ClientProductDetailState> emit) async {
     try {
      List<Product> products = await shoppingBagUseCases.getProducts.run();
      products.forEach((p) {
        print('Shopping Bag: ${p.toJson()}');
      });
    } catch (e) {
      print('Error al obtener productos del carrito: $e');
    }

  }

  Future<void> _onAddItem(AddItem event, Emitter<ClientProductDetailState> emit) async {
    emit(
      state.copyWith(quantity: state.quantity + 1)
    );
  }

  Future<void> _onSubtractItem(SubtractItem event, Emitter<ClientProductDetailState> emit) async {
    if (state.quantity >= 1) {
      emit(
      state.copyWith(quantity: state.quantity - 1)
     );
   }
  }

  Future<void> _onAddProductToShoppingBag(AddProductToShoppingBag event, Emitter<ClientProductDetailState> emit) async {
    event.product.quantity = state.quantity;
    shoppingBagUseCases.add.run(event.product);
  }
}