import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/TaxModelClasses/DeleteTaxModlClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/TaxModelClasses/SingleViewTaxModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/TaxModelClasses/TaxEditModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/TaxModelClasses/TaxListModelClass.dart';

import '../../Api Function/Tax_Api/tax_api.dart';
import '../../ModelClasses/TaxModelClasses/CreateTaxModelClass.dart';

part 'tax_event.dart';

part 'tax_state.dart';

class TaxBloc extends Bloc<TaxEvent, TaxState> {
  late CreateTaxModelClass createTaxModelClass;
  late TaxListModelClass taxListModelClass;
  late SingleViewTaxModelClass singleViewTaxModelClass;
  late TaxEditModelClass taxEditModelClass;
  late DeleteTaxModlClass deleteTaxModelClass;

  TaxApi taxApi;

  TaxBloc(this.taxApi) : super(TaxInitial()) {
    on<CreateTaxEvent>((event, emit) async {
      emit(TaxCreateLoading());
      try {
        createTaxModelClass = await taxApi.createTaxFunction(
            taxName: event.texName,
            purchaseTax: event.purchaseTax,
            saleTax: event.saleTax);
        emit(TaxCreateLoaded());
      } catch (e) {
        emit(TaxCreateError());
        print("-----------------createBlocCatchError $e");
      }
    });

    on<ListTaxEvent>((event, emit) async {
      emit(TaxListLoading());
      try {
        taxListModelClass = await taxApi.listTaxFunction(search: event.search);
        emit(TaxListLoaded());
      } catch (e) {
        emit(TaxListError());
        print("-----------------TaxListBlocCatchError $e");
      }
    });

    on<SingleViewTaxEvent>((event, emit) async {
      emit(SingleViewTaxListLoading());
      try {
        singleViewTaxModelClass =
            await taxApi.singleViewTaxFunction(id: event.id);
        emit(SingleViewTaxListLoaded());
      } catch (e) {
        emit(SingleViewTaxListError());
        print("-----------------singleViewTaxBlocCatchError $e");
      }
    });

    on<EditTaxEvent>((event, emit) async {
      emit(EditTaxLoading());
      try {
        taxEditModelClass = await taxApi.editTaxFunction(
            id: event.id,
            taxName: event.texName,
            purchaseTax: event.purchaseTax,
            salesTax: event.saleTax);
        emit(EditTaxLoaded());
      } catch (e) {
        emit(EditTaxError());
        print("-----------------editTaxBlocCatchError $e");
      }
    });
    on<DeleteTaxEvent>((event, emit) async {
      emit(DeleteTaxLoading());
      try {
        deleteTaxModelClass = await taxApi.deleteTaxFunction(id: event.id);

        emit(DeleteTaxLoaded());
      } catch (e) {
        emit(DeleteTaxError(msg: e.toString()));
        print("-----------------deleteTaxBlocCatchError $e");
      }
    });
  }
}
