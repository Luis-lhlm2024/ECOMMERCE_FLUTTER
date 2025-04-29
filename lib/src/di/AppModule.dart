import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/CategoriesService.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/ProductService.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/UsersService.dart';
import 'package:ecommerce_flutter/src/data/repository/AuthRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AuthService.dart';
import 'package:ecommerce_flutter/src/data/repository/CategoriesRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/repository/ProductsRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/repository/ShoppingBagRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/repository/UsersRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/models/ShoppingBagRepository.dart';
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';
import 'package:ecommerce_flutter/src/domain/repository/CategoriesRepository.dart';
import 'package:ecommerce_flutter/src/domain/repository/ProductsRepository.dart';
import 'package:ecommerce_flutter/src/domain/repository/UsersRepository.dart';
import 'package:ecommerce_flutter/src/domain/useCases/Products/CreateProductUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/Products/DeleteProductUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/Products/GetProductsByCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/Products/ProductsUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/Products/UpdateProductUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/ShoppingBag/AddShoppingBagUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/ShoppingBag/DeleteItemShoppingBagUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/ShoppingBag/DeleteShoppingBagUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/ShoppingBag/GetProductsShoppingBagUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/ShoppingBag/GetTotalShoppingBagUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/LogoutUSeCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/SaveUserSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/CategoriesUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/CreateCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/DeleteCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/GetCategoriesUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/UpdateCategoryUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/users/UpdateUserUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/users/UsersUseCases.dart';

import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  
  @injectable
  SharedPref get sharedPref => SharedPref();

  @injectable
  Future<String> get token async {
    String token ="";
      final userSession = await sharedPref.read('user');
      if (userSession != null) {
        AuthResponse authResponse = AuthResponse.fromJson(userSession);
        token = authResponse.token;
      }
      return token;
  }

  @injectable
  AuthService get authService => AuthService();

  @injectable
  UsersService get usersService => UsersService(token);

  @injectable
  CategoriesService get categoriesService => CategoriesService(token);

  @injectable
  ProductsService get productsService => ProductsService(token);

  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService, sharedPref);

  @injectable
  UsersRepositoryImpl get usersRepository => UsersRepositoryImpl(usersService);
  
  @injectable
  CategoriesRepository get categoriesRepository => CategoriesRepositoryImpl(categoriesService);

  @injectable
  ProductsRepositoryImpl get productsRepository => ProductsRepositoryImpl(productsService);

  @injectable
  ShoppingBagRepository get shoppingBagRepository => ShoppingBagRepositoryImpl(sharedPref);

  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
      login: LoginUseCase(authRepository),
      register: RegisterUseCase(authRepository),
      saveUserSession: SaveUserSessionUseCase(authRepository),
      getUSerSession: GetUserSessionUseCase(authRepository),
      logout: LogoutUseCase(authRepository)
  );

  @injectable
  UsersUseCases get usersUseCases => UsersUseCases(
    updateUser: UpdateUserUseCase(usersRepository as UsersRepository)
  );


  @injectable
  CategoriesUseCases get categoriesUseCases => CategoriesUseCases(
    create: CreateCategoryUseCase(categoriesRepository),
    getCategories:  GetCategoriesUseCases(categoriesRepository),
    update: UpdateCategoryUseCase(categoriesRepository),
    delete: DeleteCategoryUseCase(categoriesRepository)
    
  );

  @injectable
  ProductsUseCases get productsUseCases => ProductsUseCases (
    create: CreateProductUseCase(productsRepository),
    getProductsByCategory: GetProductsByCategoryUseCase(productsRepository),
    update: UpdateProductUseCase(productsRepository),
    delete: DeleteProductUseCase(productsRepository),     
  );

  @injectable
  ShoppingBagUseCases get shoppingBagUseCases => ShoppingBagUseCases (
    add: AddShoppingBagUseCase(shoppingBagRepository),
    getProducts: GetProductsShoppingBagUseCase(shoppingBagRepository),
    deleteItem: DeleteItemShoppingBagUseCase(shoppingBagRepository),
    deleteShoppingBag: DeleteShoppingBagUseCase(shoppingBagRepository),
    getTotal: GetTotalShoppingBagUseCase(shoppingBagRepository),
  );

}
