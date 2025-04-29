import 'package:ecommerce_flutter/src/domain/models/ShoppingBagRepository.dart';

class GetTotalShoppingBagUseCase {

  ShoppingBagRepository shoppingBagRepository;

  GetTotalShoppingBagUseCase(this.shoppingBagRepository);

  run() => shoppingBagRepository.getTotal();
}