import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:equatable/equatable.dart';

abstract class ClientProductDetailEvent extends Equatable {
  const ClientProductDetailEvent();
  @override
  List<Object?> get props => [];
}

class GetProducts extends ClientProductDetailEvent {
  const GetProducts();
}

class AddItem extends ClientProductDetailEvent {
  const AddItem();
  @override
  List<Object?> get props => [];
}

class SubtractItem extends ClientProductDetailEvent {
  const SubtractItem();
  @override
  List<Object?> get props => [];
}

class AddProductToShoppingBag extends ClientProductDetailEvent {
  final Product product;
  const AddProductToShoppingBag({ required this.product });
  @override
  List<Object?> get props => [product];
}