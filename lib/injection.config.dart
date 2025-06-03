// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart'
    as _i838;
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AddressService.dart'
    as _i993;
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/AuthService.dart'
    as _i543;
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/CategoriesService.dart'
    as _i485;
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/ProductService.dart'
    as _i463;
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/UsersService.dart'
    as _i226;
import 'package:ecommerce_flutter/src/data/repository/ProductsRepositoryImpl.dart'
    as _i71;
import 'package:ecommerce_flutter/src/data/repository/UsersRepositoryImpl.dart'
    as _i395;
import 'package:ecommerce_flutter/src/di/AppModule.dart' as _i987;
import 'package:ecommerce_flutter/src/domain/models/ShoppingBagRepository.dart'
    as _i470;
import 'package:ecommerce_flutter/src/domain/repository/AddressRepository.dart'
    as _i879;
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart'
    as _i148;
import 'package:ecommerce_flutter/src/domain/repository/CategoriesRepository.dart'
    as _i179;
import 'package:ecommerce_flutter/src/domain/useCases/address/AddressUseCases.dart'
    as _i265;
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart'
    as _i322;
import 'package:ecommerce_flutter/src/domain/useCases/categories/CategoriesUseCases.dart'
    as _i578;
import 'package:ecommerce_flutter/src/domain/useCases/Products/ProductsUseCases.dart'
    as _i467;
import 'package:ecommerce_flutter/src/domain/useCases/ShoppingBag/ShoppingBagUseCases.dart'
    as _i356;
import 'package:ecommerce_flutter/src/domain/useCases/users/UsersUseCases.dart'
    as _i525;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i838.SharedPref>(() => appModule.sharedPref);
    gh.factoryAsync<String>(() => appModule.token);
    gh.factory<_i543.AuthService>(() => appModule.authService);
    gh.factory<_i226.UsersService>(() => appModule.usersService);
    gh.factory<_i485.CategoriesService>(() => appModule.categoriesService);
    gh.factory<_i463.ProductsService>(() => appModule.productsService);
    gh.factory<_i993.AddressService>(() => appModule.addressService);
    gh.factory<_i148.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i395.UsersRepositoryImpl>(() => appModule.usersRepository);
    gh.factory<_i179.CategoriesRepository>(
        () => appModule.categoriesRepository);
    gh.factory<_i71.ProductsRepositoryImpl>(() => appModule.productsRepository);
    gh.factory<_i470.ShoppingBagRepository>(
        () => appModule.shoppingBagRepository);
    gh.factory<_i879.AddressRepository>(() => appModule.addressRepository);
    gh.factory<_i322.AuthUseCases>(() => appModule.authUseCases);
    gh.factory<_i525.UsersUseCases>(() => appModule.usersUseCases);
    gh.factory<_i578.CategoriesUseCases>(() => appModule.categoriesUseCases);
    gh.factory<_i467.ProductsUseCases>(() => appModule.productsUseCases);
    gh.factory<_i356.ShoppingBagUseCases>(() => appModule.shoppingBagUseCases);
    gh.factory<_i265.AddressUseCases>(() => appModule.addressUseCases);
    return this;
  }
}

class _$AppModule extends _i987.AppModule {}
