part of 'banner_bloc.dart';

@immutable
abstract class BannerEvent {}
class CreateBannerEvent extends BannerEvent {
  final String note;
  final String title;
  final int BranchID;
  final String CompanyID;
  final int createUserId;

  CreateBannerEvent({required this.note, required this.title,required this.BranchID,required this.CompanyID,required this.createUserId});
}
