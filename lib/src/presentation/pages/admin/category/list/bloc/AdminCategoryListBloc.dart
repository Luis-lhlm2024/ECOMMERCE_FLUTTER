import 'package:ecommerce_flutter/src/presentation/pages/admin/category/list/bloc/AdminCategoryListState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/list/bloc/AdminCategoryListEvent.dart';
import 'package:ecommerce_flutter/src/domain/useCases/categories/CategoriesUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

class AdminCategoryListBloc extends Bloc<AdminCategoryListEvent, AdminCategoryListState>{ 

  CategoriesUseCases categoriesUseCases;

  AdminCategoryListBloc (this.categoriesUseCases):super (AdminCategoryListState()){
    on<GetCategories>(_onGetCategories);
    on<DeleteCategory>(_onDeleteCategories);
    
  }

  Future <void> _onGetCategories(GetCategories event, Emitter <AdminCategoryListState>emit) async {
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

    Future <void> _onDeleteCategories(DeleteCategory event, Emitter <AdminCategoryListState>emit)async{

      emit(
      state.copyWith(
        response:Loading()
      )
    );
    Resource response = await categoriesUseCases.delete.run(event.id);
    emit(
      state.copyWith(
        response:response
      )
    );

    }


}