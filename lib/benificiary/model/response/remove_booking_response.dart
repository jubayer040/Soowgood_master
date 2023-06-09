class RemoveBookingResponse {
  String? id;
  String? bookingDate;
  String? schedule;
  String? appointmentSettingId;
  String? appointmentServiceId;
  bool? isBookingConfirmed;
  bool? isBookingCancelledByReceiver;
  bool? isBookingCancelledByProvider;
  String? serviceReceiverId;
  String? serviceProviderId;
  String? tentativeDate;
  String? tentativeTime;
  String? reportingTime;
  String? dayOfWeek;
  int? serialNo;
  bool? isProcessed;
  bool? isCancelled;
  String? status;
  bool? isRecurrent;
  int? recurringHours;
  int? noOfVisits;
  String? userPaymentStatus;
  bool? visitConfirmationStatus;
  double? paidAmount;
  double? discountamt;
  double? appointmentamt;
  double? doctorcharges;
  dynamic beneficiaryComment;
  dynamic providerComment;
  String? scheduleStartTime;
  String? scheduleEndTime;
  String? patientName;
  String? patientAddress;
  int? ratingpoints;
  dynamic providerreview;
  String? transactionid;
  int? isrefunded;
  dynamic createdBy;
  String? createdOn;
  dynamic updatedBy;
  String? updatedOn;
  bool? isDeleted;
  bool? isActive;

  RemoveBookingResponse({this.id, this.bookingDate, this.schedule, this.appointmentSettingId, this.appointmentServiceId, this.isBookingConfirmed, this.isBookingCancelledByReceiver, this.isBookingCancelledByProvider, this.serviceReceiverId, this.serviceProviderId, this.tentativeDate, this.tentativeTime, this.reportingTime, this.dayOfWeek, this.serialNo, this.isProcessed, this.isCancelled, this.status, this.isRecurrent, this.recurringHours, this.noOfVisits, this.userPaymentStatus, this.visitConfirmationStatus, this.paidAmount, this.discountamt, this.appointmentamt, this.doctorcharges, this.beneficiaryComment, this.providerComment, this.scheduleStartTime, this.scheduleEndTime, this.patientName, this.patientAddress, this.ratingpoints, this.providerreview, this.transactionid, this.isrefunded, this.createdBy, this.createdOn, this.updatedBy, this.updatedOn, this.isDeleted, this.isActive});

  RemoveBookingResponse.fromJson(Map<dynamic, dynamic> json) {
    id = json["id"];
    bookingDate = json["bookingDate"];
    schedule = json["schedule"];
    appointmentSettingId = json["appointmentSettingId"];
    appointmentServiceId = json["appointmentServiceId"];
    isBookingConfirmed = json["isBookingConfirmed"];
    isBookingCancelledByReceiver = json["isBookingCancelledByReceiver"];
    isBookingCancelledByProvider = json["isBookingCancelledByProvider"];
    serviceReceiverId = json["serviceReceiverId"];
    serviceProviderId = json["serviceProviderId"];
    tentativeDate = json["tentativeDate"];
    tentativeTime = json["tentativeTime"];
    reportingTime = json["reportingTime"];
    dayOfWeek = json["dayOfWeek"];
    serialNo = json["serialNo"];
    isProcessed = json["isProcessed"];
    isCancelled = json["isCancelled"];
    status = json["status"];
    isRecurrent = json["isRecurrent"];
    recurringHours = json["recurringHours"];
    noOfVisits = json["noOfVisits"];
    userPaymentStatus = json["userPaymentStatus"];
    visitConfirmationStatus = json["visitConfirmationStatus"];
    paidAmount = json["paidAmount"];
    discountamt = json["discountamt"];
    appointmentamt = json["appointmentamt"];
    doctorcharges = json["doctorcharges"];
    beneficiaryComment = json["beneficiaryComment"];
    providerComment = json["providerComment"];
    scheduleStartTime = json["scheduleStartTime"];
    scheduleEndTime = json["scheduleEndTime"];
    patientName = json["patientName"];
    patientAddress = json["patientAddress"];
    ratingpoints = json["ratingpoints"];
    providerreview = json["providerreview"];
    transactionid = json["transactionid"];
    isrefunded = json["isrefunded"];
    createdBy = json["createdBy"];
    createdOn = json["createdOn"];
    updatedBy = json["updatedBy"];
    updatedOn = json["updatedOn"];
    isDeleted = json["isDeleted"];
    isActive = json["isActive"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["bookingDate"] = bookingDate;
    _data["schedule"] = schedule;
    _data["appointmentSettingId"] = appointmentSettingId;
    _data["appointmentServiceId"] = appointmentServiceId;
    _data["isBookingConfirmed"] = isBookingConfirmed;
    _data["isBookingCancelledByReceiver"] = isBookingCancelledByReceiver;
    _data["isBookingCancelledByProvider"] = isBookingCancelledByProvider;
    _data["serviceReceiverId"] = serviceReceiverId;
    _data["serviceProviderId"] = serviceProviderId;
    _data["tentativeDate"] = tentativeDate;
    _data["tentativeTime"] = tentativeTime;
    _data["reportingTime"] = reportingTime;
    _data["dayOfWeek"] = dayOfWeek;
    _data["serialNo"] = serialNo;
    _data["isProcessed"] = isProcessed;
    _data["isCancelled"] = isCancelled;
    _data["status"] = status;
    _data["isRecurrent"] = isRecurrent;
    _data["recurringHours"] = recurringHours;
    _data["noOfVisits"] = noOfVisits;
    _data["userPaymentStatus"] = userPaymentStatus;
    _data["visitConfirmationStatus"] = visitConfirmationStatus;
    _data["paidAmount"] = paidAmount;
    _data["discountamt"] = discountamt;
    _data["appointmentamt"] = appointmentamt;
    _data["doctorcharges"] = doctorcharges;
    _data["beneficiaryComment"] = beneficiaryComment;
    _data["providerComment"] = providerComment;
    _data["scheduleStartTime"] = scheduleStartTime;
    _data["scheduleEndTime"] = scheduleEndTime;
    _data["patientName"] = patientName;
    _data["patientAddress"] = patientAddress;
    _data["ratingpoints"] = ratingpoints;
    _data["providerreview"] = providerreview;
    _data["transactionid"] = transactionid;
    _data["isrefunded"] = isrefunded;
    _data["createdBy"] = createdBy;
    _data["createdOn"] = createdOn;
    _data["updatedBy"] = updatedBy;
    _data["updatedOn"] = updatedOn;
    _data["isDeleted"] = isDeleted;
    _data["isActive"] = isActive;
    return _data;
  }
}