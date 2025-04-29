import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/ShoppingBag/bloc/ClientShoppingBagEvent.dart';

abstract class ShoppingBagRepository {

    Future<void> add(Product product);
    Future<List<Product>> getProducts();
    Future<void> deleteItem(Product product);
    Future<void> deleteShoppingBag();
    Future<void> GetTotal();        

}