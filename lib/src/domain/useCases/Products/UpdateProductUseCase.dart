import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/domain/repository/ProductsRepository.dart';

class UpdarteProductUseCase {

  ProductsRepository productsRepository;

  UpdarteProductUseCase(this.productsRepository);

  run (int id, Product product, List<File>? files, List<int>? imagesToUpdate) => productsRepository.update(id, product, files, imagesToUpdate);
}