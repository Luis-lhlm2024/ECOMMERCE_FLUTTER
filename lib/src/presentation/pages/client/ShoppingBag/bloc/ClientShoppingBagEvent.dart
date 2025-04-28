import 'package:equatable/equatable.dart';

abstract class ClientShoppingBagEvent extends Equatable {
  const ClientShoppingBagEvent();
  @override
  List<Object?> get props => [];
}

class GetShoppingBag extends ClientShoppingBagEvent {
  const GetShoppingBag();
}