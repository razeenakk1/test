class Data {
  Data({
      this.brandID, 
      this.branchID, 
      this.brandName, 
      this.notes,});

  Data.fromJson(dynamic json) {
    brandID = json['BrandID'];
    branchID = json['BranchID'];
    brandName = json['BrandName'];
    notes = json['Notes'];
  }
  int brandID;
  int branchID;
  String brandName;
  String notes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BrandID'] = brandID;
    map['BranchID'] = branchID;
    map['BrandName'] = brandName;
    map['Notes'] = notes;
    return map;
  }

}