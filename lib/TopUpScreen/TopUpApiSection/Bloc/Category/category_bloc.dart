import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Category/CreateCategoryModlClass.dart';

import '../../Api Function/Category/category_api.dart';
import '../../ModelClasses/Category/CategoryListModelClass.dart';
import '../../ModelClasses/Category/DeleteCategorModelClass.dart';
import '../../ModelClasses/Category/EditCategoryModelClass.dart';
import '../../ModelClasses/Category/SingleViewCategoryModelClass.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  late CategoryListModelClass categoryListModelClass;
  late CreateCategoryModlClass createCategoryModelClass;
  late SingleViewCategoryModelClass singleViewCategoryModelClass;
 late  EditCategoryModelClass editCategoryModelClass;
 late  DeleteCategorModelClass deleteCategoryModelClass ;
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
    on<SingleViewCategoryEvent>((event, emit)async {
      emit(CategorySingleViewLoading());
      try{
        singleViewCategoryModelClass = await categoryApi.singleViewCategoryFunction(id: event.id);
        emit(CategorySingleViewLoaded());

      }catch(e){
        emit(CategorySingleViewError());
        print("-----------------singleViewCategoryBlocCatchError $e");


      }
    });
    on<EditCategoryEvent>((event, emit)async {
      emit(CategoryEditLoading());
      try{
        editCategoryModelClass = await categoryApi.editCategoryFunction(id: event.id, categoryName: event.categoryName);
        emit(CategoryEditLoaded());

      }catch(e){
        emit(CategoryEditError());
        print("-----------------editCategoryBlocCatchError $e");


      }
    });



    on<DeleteCategoryEvent>((event, emit)async {
      emit(CategoryDeleteLoading());
      try{
        deleteCategoryModelClass = await categoryApi.deleteCategoryFunction(id: event.id);

        emit(CategoryDeleteLoaded());

      }catch(e){
        emit(CategoryDeleteError());
        print("-----------------deleteCategoryBlocCatchError $e");


      }
    });



  }
}
