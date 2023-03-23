import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Category/CreateCategoryModlClass.dart';

import '../../Api Function/Category/category_api.dart';
import '../../ModelClasses/Category/CategoryListModelClass.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  late CategoryListModelClass categoryListModelClass;
  late CreateCategoryModlClass createCategoryModelClass;
  CategoryApi categoryApi;
  CategoryBloc(this.categoryApi) : super(CategoryInitial()) {
    on<ListCategoryEvent>((event, emit)async {
      emit(CategoryListLoading());
      try{
        categoryListModelClass = await categoryApi.listAndSearchApiFunction(search: event.search);
        emit(CategoryListLoaded());

      }catch(e){
        emit(CategoryListError());
        print("-----------------listCategoryBlocCatchError $e");


      }
    });

    on<CreateCategoryEvent>((event, emit)async {
      emit(CategoryCreateLoading());
      try{
        createCategoryModelClass = await categoryApi.createCategoryFunction(categoryName: event.categoryName);
        emit(CategoryCreateLoaded());

      }catch(e){
        emit(CategoryCreateError());
        print("-----------------createCategoryBlocCatchError $e");


      }
    });
  }
}
