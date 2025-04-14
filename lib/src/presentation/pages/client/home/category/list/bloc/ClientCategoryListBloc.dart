import 'package:ecommerce_flutter/src/presentation/pages/client/home/category/list/bloc/ClientCategoryListEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/home/category/list/bloc/ClientCategoryListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/CategoriesUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

class ClientCategoryListBloc extends Bloc<ClientCategoryListEvent, ClientCategoryListState>{ 

  CategoriesUseCases categoriesUseCases;

  ClientCategoryListBloc (this.categoriesUseCases):super (ClientCategoryListState()){
    on<GetCategories>(_onGetCategories);
    
  }

  Future <void> _onGetCategories(GetCategories event, Emitter <ClientCategoryListState>emit) async {
    emit(
      state.copyWith(
        response:Loading()
      )
    );
    Resource response = await categoriesUseCases.getCategories.run();

      print("Tipo de response.data: ${response.data.runtimeType}");
      print("Contenido de response.data: ${response.data}");

    emit(
      state.copyWith(
        response:response
      )
    );
  }

}