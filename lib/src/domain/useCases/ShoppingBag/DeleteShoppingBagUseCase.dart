import 'package:ecommerce_flutter/src/domain/models/ShoppingBagRepository.dart';

class DeleteShoppingBagUseCase {

  ShoppingBagRepository shoppingBagRepository;

  DeleteShoppingBagUseCase(this.shoppingBagRepository);

  run() => shoppingBagRepository.deleteShoppingBag();
}