import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Area/AreaListModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Area/DeleteAreaModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Area/EditAreaModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/Area/SingleViewAreaModelClass.dart';

import '../../Api Function/Area/area_api.dart';
import '../../ModelClasses/Area/CreateAreaModelClass.dart';

part 'area_event.dart';
part 'area_state.dart';

class AreaBloc extends Bloc<AreaEvent, AreaState> {
  late  CreateAreaModelClass createAreaModelClass;
  late  AreaListModelClass areaListModelClass;
  late  DeleteAreaModelClass deleteAreaModelClass ;
  late EditAreaModelClass editAreaModelClass ;
  late SingleViewAreaModelClass singleViewAreaModelClass ;

  AreaApi areaApi;
  AreaBloc(this.areaApi) : super(AreaInitial()) {
    on<CreateAreaEvent>((event, emit) async {
      emit(AreaCreateLoading());
      try {
        createAreaModelClass =
        await areaApi.createAreaFunction(areaName: event.areaName);
        emit(AreaCreateLoaded());
      } catch (e) {
        emit(AreaCreateError());
        print("-----------------createAreaBlocCatchError $e");
      }

    });
    on<ListAreaEvent>((event, emit) async {
      emit(AreaListLoading());
      try {
        areaListModelClass =
        await areaApi.listAndSearchAreaApiFunction(search: event.search);
        emit(AreaListLoaded());
      } catch (e) {
        emit(AreaListError());
        print("-----------------listAreaBlocCatchError $e");
      }
    });
    on<SingleViewAreaEvent>((event, emit) async {
      emit(AreaSingleViewLoading());
      try {
        singleViewAreaModelClass =
        await areaApi.singleViewAreaFunction(id: event.id);
        emit(AreaSingleViewLoaded());
      } catch (e) {
        emit(AreaSingleViewError());
        print("-----------------singleViewAreaBlocCatchError $e");
      }
    });
    on<EditAreaEvent>((event, emit) async {
      emit(AreaEditLoading());
      try {
        editAreaModelClass = await areaApi.editAreaFunction(id: event.id, areaName: event.areaName);
        emit(AreaEditLoaded());
      } catch (e) {
        emit(AreaEditError());
        print("-----------------editAreaBlocCatchError $e");
      }
    });


    on<DeleteAreaEvent>((event, emit) async {
      emit(AreaDeleteLoading());
      try {
        deleteAreaModelClass =
        await areaApi.deleteAreaFunction(id: event.id);

        emit(AreaDeleteLoaded());
      } catch (e) {
        emit(AreaDeleteError());
        print("-----------------deleteAreaBlocCatchError $e");
      }
    });
  }
}
