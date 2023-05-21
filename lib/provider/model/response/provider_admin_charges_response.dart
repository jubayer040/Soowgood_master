class ProviderAdminChargesResponse {
  String? id;
  String? planId;
  int? numberOfUsers;
  double? totalAmount;
  String? userId;
  String? name;
  String? description;
  String? planStartingDate;
  String? trialPeriodOver;
  double? registrationFees;
  double? yearlyFees;
  double? amountPerUser;
  int? numberOfFreeUsers;
  double? discountAmount;
  bool? isDiscount;
  bool? isTrialPeriodOver;
  bool? isOrganization;
  bool? isFree;
  bool? isMonthly;
  bool? isWeekly;
  bool? isCustomized;
  bool? isYearly;
  bool? isDefault;
  String? currency;
  String? currencySymbol;
  String? userTypeId;
  double? commission;
  dynamic createdBy;
  String? createdOn;
  dynamic updatedBy;
  String? updatedOn;
  bool? isDeleted;
  bool? isActive;

  ProviderAdminChargesResponse({this.id, this.planId, this.numberOfUsers, this.totalAmount, this.userId, this.name, this.description, this.planStartingDate, this.trialPeriodOver, this.registrationFees, this.yearlyFees, this.amountPerUser, this.numberOfFreeUsers, this.discountAmount, this.isDiscount, this.isTrialPeriodOver, this.isOrganization, this.isFree, this.isMonthly, this.isWeekly, this.isCustomized, this.isYearly, this.isDefault, this.currency, this.currencySymbol, this.userTypeId, this.commission, this.createdBy, this.createdOn, this.updatedBy, this.updatedOn, this.isDeleted, this.isActive});

  ProviderAdminChargesResponse.fromJson(Map<dynamic, dynamic> json) {
    this.id = json["id"];
    this.planId = json["planId"];
    this.numberOfUsers = json["numberOfUsers"];
    this.totalAmount = json["totalAmount"];
    this.userId = json["userId"];
    this.name = json["name"];
    this.description = json["description"];
    this.planStartingDate = json["planStartingDate"];
    this.trialPeriodOver = json["trialPeriodOver"];
    this.registrationFees = json["registrationFees"];
    this.yearlyFees = json["yearlyFees"];
    this.amountPerUser = json["amountPerUser"];
    this.numberOfFreeUsers = json["numberOfFreeUsers"];
    this.discountAmount = json["discountAmount"];
    this.isDiscount = json["isDiscount"];
    this.isTrialPeriodOver = json["isTrialPeriodOver"];
    this.isOrganization = json["isOrganization"];
    this.isFree = json["isFree"];
    this.isMonthly = json["isMonthly"];
    this.isWeekly = json["isWeekly"];
    this.isCustomized = json["isCustomized"];
    this.isYearly = json["isYearly"];
    this.isDefault = json["isDefault"];
    this.currency = json["currency"];
    this.currencySymbol = json["currencySymbol"];
    this.userTypeId = json["userTypeId"];
    this.commission = json["commission"];
    this.createdBy = json["createdBy"];
    this.createdOn = json["createdOn"];
    this.updatedBy = json["updatedBy"];
    this.updatedOn = json["updatedOn"];
    this.isDeleted = json["isDeleted"];
    this.isActive = json["isActive"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = this.id;
    data["planId"] = this.planId;
    data["numberOfUsers"] = this.numberOfUsers;
    data["totalAmount"] = this.totalAmount;
    data["userId"] = this.userId;
    data["name"] = this.name;
    data["description"] = this.description;
    data["planStartingDate"] = this.planStartingDate;
    data["trialPeriodOver"] = this.trialPeriodOver;
    data["registrationFees"] = this.registrationFees;
    data["yearlyFees"] = this.yearlyFees;
    data["amountPerUser"] = this.amountPerUser;
    data["numberOfFreeUsers"] = this.numberOfFreeUsers;
    data["discountAmount"] = this.discountAmount;
    data["isDiscount"] = this.isDiscount;
    data["isTrialPeriodOver"] = this.isTrialPeriodOver;
    data["isOrganization"] = this.isOrganization;
    data["isFree"] = this.isFree;
    data["isMonthly"] = this.isMonthly;
    data["isWeekly"] = this.isWeekly;
    data["isCustomized"] = this.isCustomized;
    data["isYearly"] = this.isYearly;
    data["isDefault"] = this.isDefault;
    data["currency"] = this.currency;
    data["currencySymbol"] = this.currencySymbol;
    data["userTypeId"] = this.userTypeId;
    data["commission"] = this.commission;
    data["createdBy"] = this.createdBy;
    data["createdOn"] = this.createdOn;
    data["updatedBy"] = this.updatedBy;
    data["updatedOn"] = this.updatedOn;
    data["isDeleted"] = this.isDeleted;
    data["isActive"] = this.isActive;
    return data;
  }
}