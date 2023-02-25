import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:topuptest/Api_Section/All_Api/brand_API.dart';
import 'package:topuptest/Api_Section/ModelClasses/BrandCreateModelClass.dart';
import 'package:topuptest/Api_Section/ModelClasses/SingleViewBrandModelClass.dart';

part 'brand_event.dart';

part 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  late BrandCreateModelClass brandCreateModelClass;
  //late   SingleViewBrandModelClass singleViewBrandModelClass;

  BrandApi brandApi;

  BrandBloc(this.brandApi) : super(BrandInitial()) {
    on<CreateBrandEvent>((event, emit) async {
      emit(BrandLoading());
      try {
        brandCreateModelClass = await brandApi.createBanner(
          brandName: event.title,
          notes: event.note,
          createUserId: event.createUserId,
          branchID: event.branchID,
          companyID: event.companyID,
        );
        emit(BrandLoaded());
      } catch (e) {
        emit(BrandError());
        print("+++++++++++++++$e");
      }

      // TODO: implement event handler
    });

    on<DeleteMethodEvent>((event, emit) async {
      emit(DeleteLoading());
      try {
        Response response = await brandApi.deleteBanner(
            createUserId: event.createUserId,
            companyId: event.companyId,
            branchId: event.branchId);
        emit(DeleteLoaded());
      } catch (e) {
        emit(DeleteError());
        print("_______________________________$e");
      }

      // TODO: implement event handler
    });

    on<SingleViewEvent>((event, emit) async {
      emit (SingleViewLoading());
      try{
        Response response = await brandApi.singleViewBrand(companyID: event.companyID, branchId: event.branchId, brandName: event.brandName, notes: event.notes, userID: event.userID);
        emit(SingleViewLoaded());
      }catch(e){
        emit(SingleViewError());
        print("____________________***********$e");
      }

      // TODO: implement event handler
    });















  }










}
