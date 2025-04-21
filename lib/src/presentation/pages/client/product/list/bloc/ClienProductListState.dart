import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:equatable/equatable.dart';

class ClientProductListState extends Equatable {

  final Resource? response;

  const ClientProductListState({this.response});

  ClientProductListState copywith({
    Resource? response
  }) {
    return ClientProductListState(response: response);
  }
  
  @override
  List<Object?> get props => [response];
}