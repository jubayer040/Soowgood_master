import 'dart:convert';

List<GetPatientDocumentHistoryResponse> GetPatientDocumentHistoryResponseFromJsonList(dynamic str) => List<GetPatientDocumentHistoryResponse>.from(json.decode(str).map((x) => GetPatientDocumentHistoryResponse.fromJson(x)));

String GetPatientDocumentHistoryResponseToJsonList(List<GetPatientDocumentHistoryResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetPatientDocumentHistoryResponse {
  dynamic serviceProvider;
  String? dayStartingTime;
  String? dayEndingTime;
  dynamic address;
  dynamic clinicName;
  dynamic clinicAddress;
  dynamic clinicId;
  String? id;
  String? bookingDate;
  String? schedule;
  dynamic appointmentSettingId;
  bool? isBookingConfirmed;
  bool? isBookingCancelledByReceiver;
  bool? isBookingCancelledByProvider;
  dynamic serviceReceiverId;
  dynamic serviceProviderId;
  dynamic appointmentTypeId;
  dynamic appointmentType;
  String? tentativeDate;
  String? tentativeTime;
  String? reportingTime;
  dynamic dayOfWeek;
  int? serialNo;
  bool? isProcessed;
  bool? isCancelled;
  dynamic serviceReceiver;
  String? appointmentDate;
  String? appointmentTime;
  dynamic receiverImage;
  dynamic providerImage;
  dynamic receiverEmail;
  dynamic receiverPhone;
  dynamic providerEmail;
  dynamic providerPhone;
  double? appointmentFees;
  double? amount;
  dynamic status;
  bool? isRecurrent;
  int? recurringHours;
  int? noOfVisits;
  dynamic userPaymentStatus;
  bool? visitConfirmationStatus;
  double? paidAmount;
  double? doctorcharges;
  double? admincomission;
  bool? isActive;
  dynamic startDate;
  dynamic endDate;
  dynamic beneficiaryComment;
  dynamic providerComment;
  int? pageSize;
  int? pageNumber;
  dynamic specializationName;
  dynamic bookingtype;
  dynamic tentativeBookingDate;
  int? isPaymentDone;
  int? isnewpatient;
  dynamic appointmentStatus;
  dynamic appointmentTypeName;
  dynamic lastApointmentDate;
  dynamic tentativeAppointmentDate;
  dynamic patientAddress;
  dynamic bloodGroup;
  int? age;
  dynamic gender;
  int? totalratingpoint;
  int? totalreview;
  int? ratingpoints;
  dynamic providerreview;
  dynamic patientName;
  dynamic patientCurrentAddress;
  dynamic callstatus;
  String? documentname;
  dynamic booingId;
  dynamic appointmentNo;
  String? scheduleAppointmentDate;
  dynamic bookingAppointmentDate;
  dynamic trancurrency;
  String? scheduleStartTime;
  String? scheduleEndTime;
  dynamic scheduleTime;
  dynamic bookingstatus;
  dynamic transno;
  dynamic paybackstatus;
  int? srno;
  dynamic paybackid;
  dynamic diognosis;
  dynamic appointmentno;
  dynamic bookingId;
  dynamic serviceType;
  dynamic provider;
  dynamic prescriptiondate;
  dynamic sourcefrom;

  GetPatientDocumentHistoryResponse({this.serviceProvider, this.dayStartingTime, this.dayEndingTime, this.address, this.clinicName, this.clinicAddress, this.clinicId, this.id, this.bookingDate, this.schedule, this.appointmentSettingId, this.isBookingConfirmed, this.isBookingCancelledByReceiver, this.isBookingCancelledByProvider, this.serviceReceiverId, this.serviceProviderId, this.appointmentTypeId, this.appointmentType, this.tentativeDate, this.tentativeTime, this.reportingTime, this.dayOfWeek, this.serialNo, this.isProcessed, this.isCancelled, this.serviceReceiver, this.appointmentDate, this.appointmentTime, this.receiverImage, this.providerImage, this.receiverEmail, this.receiverPhone, this.providerEmail, this.providerPhone, this.appointmentFees, this.amount, this.status, this.isRecurrent, this.recurringHours, this.noOfVisits, this.userPaymentStatus, this.visitConfirmationStatus, this.paidAmount, this.doctorcharges, this.admincomission, this.isActive, this.startDate, this.endDate, this.beneficiaryComment, this.providerComment, this.pageSize, this.pageNumber, this.specializationName, this.bookingtype, this.tentativeBookingDate, this.isPaymentDone, this.isnewpatient, this.appointmentStatus, this.appointmentTypeName, this.lastApointmentDate, this.tentativeAppointmentDate, this.patientAddress, this.bloodGroup, this.age, this.gender, this.totalratingpoint, this.totalreview, this.ratingpoints, this.providerreview, this.patientName, this.patientCurrentAddress, this.callstatus, this.documentname, this.booingId, this.appointmentNo, this.scheduleAppointmentDate, this.bookingAppointmentDate, this.trancurrency, this.scheduleStartTime, this.scheduleEndTime, this.scheduleTime, this.bookingstatus, this.transno, this.paybackstatus, this.srno, this.paybackid, this.diognosis, this.appointmentno, this.bookingId, this.serviceType, this.provider, this.prescriptiondate, this.sourcefrom});

  GetPatientDocumentHistoryResponse.fromJson(Map<String, dynamic> json) {
    serviceProvider = json["serviceProvider"];
    dayStartingTime = json["dayStartingTime"];
    dayEndingTime = json["dayEndingTime"];
    address = json["address"];
    clinicName = json["clinicName"];
    clinicAddress = json["clinicAddress"];
    clinicId = json["clinicId"];
    id = json["id"];
    bookingDate = json["bookingDate"];
    schedule = json["schedule"];
    appointmentSettingId = json["appointmentSettingId"];
    isBookingConfirmed = json["isBookingConfirmed"];
    isBookingCancelledByReceiver = json["isBookingCancelledByReceiver"];
    isBookingCancelledByProvider = json["isBookingCancelledByProvider"];
    serviceReceiverId = json["serviceReceiverId"];
    serviceProviderId = json["serviceProviderId"];
    appointmentTypeId = json["appointmentTypeId"];
    appointmentType = json["appointmentType"];
    tentativeDate = json["tentativeDate"];
    tentativeTime = json["tentativeTime"];
    reportingTime = json["reportingTime"];
    dayOfWeek = json["dayOfWeek"];
    serialNo = json["serialNo"];
    isProcessed = json["isProcessed"];
    isCancelled = json["isCancelled"];
    serviceReceiver = json["serviceReceiver"];
    appointmentDate = json["appointmentDate"];
    appointmentTime = json["appointmentTime"];
    receiverImage = json["receiverImage"];
    providerImage = json["providerImage"];
    receiverEmail = json["receiverEmail"];
    receiverPhone = json["receiverPhone"];
    providerEmail = json["providerEmail"];
    providerPhone = json["providerPhone"];
    appointmentFees = json["appointmentFees"];
    amount = json["amount"];
    status = json["status"];
    isRecurrent = json["isRecurrent"];
    recurringHours = json["recurringHours"];
    noOfVisits = json["noOfVisits"];
    userPaymentStatus = json["userPaymentStatus"];
    visitConfirmationStatus = json["visitConfirmationStatus"];
    paidAmount = json["paidAmount"];
    doctorcharges = json["doctorcharges"];
    admincomission = json["admincomission"];
    isActive = json["isActive"];
    startDate = json["startDate"];
    endDate = json["endDate"];
    beneficiaryComment = json["beneficiaryComment"];
    providerComment = json["providerComment"];
    pageSize = json["pageSize"];
    pageNumber = json["pageNumber"];
    specializationName = json["specializationName"];
    bookingtype = json["bookingtype"];
    tentativeBookingDate = json["tentativeBookingDate"];
    isPaymentDone = json["isPaymentDone"];
    isnewpatient = json["isnewpatient"];
    appointmentStatus = json["appointmentStatus"];
    appointmentTypeName = json["appointmentTypeName"];
    lastApointmentDate = json["lastApointmentDate"];
    tentativeAppointmentDate = json["tentativeAppointmentDate"];
    patientAddress = json["patientAddress"];
    bloodGroup = json["bloodGroup"];
    age = json["age"];
    gender = json["gender"];
    totalratingpoint = json["totalratingpoint"];
    totalreview = json["totalreview"];
    ratingpoints = json["ratingpoints"];
    providerreview = json["providerreview"];
    patientName = json["patientName"];
    patientCurrentAddress = json["patientCurrentAddress"];
    callstatus = json["callstatus"];
    documentname = json["documentname"];
    booingId = json["booingId"];
    appointmentNo = json["appointmentNo"];
    scheduleAppointmentDate = json["scheduleAppointmentDate"];
    bookingAppointmentDate = json["bookingAppointmentDate"];
    trancurrency = json["trancurrency"];
    scheduleStartTime = json["scheduleStartTime"];
    scheduleEndTime = json["scheduleEndTime"];
    scheduleTime = json["scheduleTime"];
    bookingstatus = json["bookingstatus"];
    transno = json["transno"];
    paybackstatus = json["paybackstatus"];
    srno = json["srno"];
    paybackid = json["paybackid"];
    diognosis = json["diognosis"];
    appointmentno = json["appointmentno"];
    bookingId = json["bookingId"];
    serviceType = json["serviceType"];
    provider = json["provider"];
    prescriptiondate = json["prescriptiondate"];
    sourcefrom = json["sourcefrom"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["serviceProvider"] = serviceProvider;
    _data["dayStartingTime"] = dayStartingTime;
    _data["dayEndingTime"] = dayEndingTime;
    _data["address"] = address;
    _data["clinicName"] = clinicName;
    _data["clinicAddress"] = clinicAddress;
    _data["clinicId"] = clinicId;
    _data["id"] = id;
    _data["bookingDate"] = bookingDate;
    _data["schedule"] = schedule;
    _data["appointmentSettingId"] = appointmentSettingId;
    _data["isBookingConfirmed"] = isBookingConfirmed;
    _data["isBookingCancelledByReceiver"] = isBookingCancelledByReceiver;
    _data["isBookingCancelledByProvider"] = isBookingCancelledByProvider;
    _data["serviceReceiverId"] = serviceReceiverId;
    _data["serviceProviderId"] = serviceProviderId;
    _data["appointmentTypeId"] = appointmentTypeId;
    _data["appointmentType"] = appointmentType;
    _data["tentativeDate"] = tentativeDate;
    _data["tentativeTime"] = tentativeTime;
    _data["reportingTime"] = reportingTime;
    _data["dayOfWeek"] = dayOfWeek;
    _data["serialNo"] = serialNo;
    _data["isProcessed"] = isProcessed;
    _data["isCancelled"] = isCancelled;
    _data["serviceReceiver"] = serviceReceiver;
    _data["appointmentDate"] = appointmentDate;
    _data["appointmentTime"] = appointmentTime;
    _data["receiverImage"] = receiverImage;
    _data["providerImage"] = providerImage;
    _data["receiverEmail"] = receiverEmail;
    _data["receiverPhone"] = receiverPhone;
    _data["providerEmail"] = providerEmail;
    _data["providerPhone"] = providerPhone;
    _data["appointmentFees"] = appointmentFees;
    _data["amount"] = amount;
    _data["status"] = status;
    _data["isRecurrent"] = isRecurrent;
    _data["recurringHours"] = recurringHours;
    _data["noOfVisits"] = noOfVisits;
    _data["userPaymentStatus"] = userPaymentStatus;
    _data["visitConfirmationStatus"] = visitConfirmationStatus;
    _data["paidAmount"] = paidAmount;
    _data["doctorcharges"] = doctorcharges;
    _data["admincomission"] = admincomission;
    _data["isActive"] = isActive;
    _data["startDate"] = startDate;
    _data["endDate"] = endDate;
    _data["beneficiaryComment"] = beneficiaryComment;
    _data["providerComment"] = providerComment;
    _data["pageSize"] = pageSize;
    _data["pageNumber"] = pageNumber;
    _data["specializationName"] = specializationName;
    _data["bookingtype"] = bookingtype;
    _data["tentativeBookingDate"] = tentativeBookingDate;
    _data["isPaymentDone"] = isPaymentDone;
    _data["isnewpatient"] = isnewpatient;
    _data["appointmentStatus"] = appointmentStatus;
    _data["appointmentTypeName"] = appointmentTypeName;
    _data["lastApointmentDate"] = lastApointmentDate;
    _data["tentativeAppointmentDate"] = tentativeAppointmentDate;
    _data["patientAddress"] = patientAddress;
    _data["bloodGroup"] = bloodGroup;
    _data["age"] = age;
    _data["gender"] = gender;
    _data["totalratingpoint"] = totalratingpoint;
    _data["totalreview"] = totalreview;
    _data["ratingpoints"] = ratingpoints;
    _data["providerreview"] = providerreview;
    _data["patientName"] = patientName;
    _data["patientCurrentAddress"] = patientCurrentAddress;
    _data["callstatus"] = callstatus;
    _data["documentname"] = documentname;
    _data["booingId"] = booingId;
    _data["appointmentNo"] = appointmentNo;
    _data["scheduleAppointmentDate"] = scheduleAppointmentDate;
    _data["bookingAppointmentDate"] = bookingAppointmentDate;
    _data["trancurrency"] = trancurrency;
    _data["scheduleStartTime"] = scheduleStartTime;
    _data["scheduleEndTime"] = scheduleEndTime;
    _data["scheduleTime"] = scheduleTime;
    _data["bookingstatus"] = bookingstatus;
    _data["transno"] = transno;
    _data["paybackstatus"] = paybackstatus;
    _data["srno"] = srno;
    _data["paybackid"] = paybackid;
    _data["diognosis"] = diognosis;
    _data["appointmentno"] = appointmentno;
    _data["bookingId"] = bookingId;
    _data["serviceType"] = serviceType;
    _data["provider"] = provider;
    _data["prescriptiondate"] = prescriptiondate;
    _data["sourcefrom"] = sourcefrom;
    return _data;
  }
}