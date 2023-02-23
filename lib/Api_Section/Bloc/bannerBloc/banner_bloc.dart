import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:topuptest/Api_Section/All_Api/create_api.dart';
import 'package:topuptest/Api_Section/ModelClasses/BrandCreateModelClass.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  late BrandCreateModelClass brandCreateModelClass;

  BannerApi bannerApi;
  BannerBloc(this.bannerApi) : super(BannerInitial()) {
    on<CreateBannerEvent>((event, emit) async{
      emit(BannerLoading());
      try {
        brandCreateModelClass= await bannerApi.createBanner(brandName: event.title, notes: event.note, createUserId: event.createUserId, BranchID:event.BranchID, CompanyID: event.CompanyID,);
        emit(BannerLoaded());
      } catch (e) {
        emit(BannerError());
        print("+++++++++++++++$e");
      }

      // TODO: implement event handler
    });
  }
}

