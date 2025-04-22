import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/models/ShoppingBagRepository.dart';

class ShoppingBagRepositoryImpl implements ShoppingBagRepository {

  SharedPref sharedPref;

  ShoppingBagRepositoryImpl(this.sharedPref);
  
  @override
  Future<void> add(Product product) async {
    final data = await sharedPref.read('shopping_bag');
    List<Product> selectedProducts = [];
    if (data == null) {
      selectedProducts.add(product);
      await sharedPref.save('shopping_bag', selectedProducts);
    }
    else {
      selectedProducts = Product.fromJsonList(data);
      int index = selectedProducts.indexWhere((p) => p.id == product.id);
      if (index == -1) { // El Producto no existe en la Bolsa de Compras (AñADIR)
        product.quantity ??= 1;
        selectedProducts.add(product);
      }
      else { // Ya existe el producto dentro de la lista (ACTUALIZAR)
        selectedProducts[index].quantity = product.quantity;
      }
      await sharedPref.save('shopping_bag', selectedProducts);
    }
  }

  @override
  Future<void> deleteItem(Product product) async {
    final data = await sharedPref.read('shopping_bag');
    if (data == null) return; 
    List<Product> selectedProducts = Product.fromJsonList(data);
    //selectedProducts = Product.fromJsonList(data).toString() as List<Product>;
    selectedProducts.removeWhere((p) => p.id == product.id);
    await sharedPref.save('shopping_bag', selectedProducts);
  }

  @override
  Future<void> deleteShoppingBag() async {
    await sharedPref.remove('shopping_bag');
  }

  @override
  Future<List<Product>> getProducts() async {
    final data = await sharedPref.read('shopping_bag');
    if (data == null) {
      return [];
    }
    List<Product> selectedProducts = Product.fromJsonList(data);
    //selectedProducts = Product.fromJsonList(data).toString() as List<Product>;
    return selectedProducts;
  }

}