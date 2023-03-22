
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/SingleViewTaxModelClass.dart';
import 'package:topuptest/TopUpScreen/TopUpApiSection/ModelClasses/TaxListModelClass.dart';

import '../../Api Function/Tax/tax_api.dart';
import '../../ModelClasses/CreateTaxModelClass.dart';

part 'tax_event.dart';
part 'tax_state.dart';

class TaxBloc extends Bloc<TaxEvent, TaxState> {
  late CreateTaxModelClass createTaxModelClass;
  late TaxListModelClass taxListModelClass;
  late SingleViewTaxModelClass singleViewTaxModelClass;
  TaxApi taxApi;
  TaxBloc(this.taxApi) : super(TaxInitial()) {
    on<CreateTaxEvent>((event, emit)async {
      emit(TaxCreateLoading());
      try{
        createTaxModelClass = await taxApi.createTaxFunction(taxName: event.texName, purchaseTax: event.purchaseTax, saleTax: event.saleTax);
        emit(TaxCreateLoaded());

      }catch(e){
        emit(TaxCreateError());
        print("-----------------createBlocCatchError $e");}
    });

    on<ListTaxEvent>((event, emit)async {
      emit(TaxListLoading());
      try{
       taxListModelClass = await taxApi.listTaxFunction();
        emit(TaxListLoaded());

      }catch(e){
        emit(TaxListError());
        print("-----------------TaxListBlocCatchError $e");}
    });

    on<SingleViewTaxEvent>((event, emit)async {
      emit(SingleViewTaxListLoading());
      try{
     singleViewTaxModelClass = await taxApi.singleViewTaxFunction(id: event.id);
        emit(SingleViewTaxListLoaded());
      }catch(e){
        emit(SingleViewTaxListError());
        print("-----------------singleViewTaxBlocCatchError $e");


      }
    });
  }
}
