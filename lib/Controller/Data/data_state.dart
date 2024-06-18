part of 'data_cubit.dart';

@immutable
sealed class DataState {}

final class DataInitial extends DataState {}
class GetVehicleTypesLoadingState extends DataState {}
class GetVehicleTypesSuccessState extends DataState {}
class GetVehicleTypesErrorState extends DataState {}



class GetInProgressTripDetailsLoadingState extends DataState {}
class GetInProgressTripDetailsSuccessState extends DataState {}
class GetInProgressTripDetailsErrorState extends DataState {}


class GetLicenseDataLoadingState extends DataState {}
class GetLicenseDataSuccessState extends DataState {}
class GetLicenseDataErrorState extends DataState {}

class GetInsuranceDataLoadingState extends DataState {}
class GetInsuranceDataSuccessState extends DataState {}
class GetInsuranceDataErrorState extends DataState {}


class GetDriverDataLoadingState extends DataState {}
class GetDriverDataSuccessState extends DataState {}
class GetDriverDataErrorState extends DataState {}

class GetDriverVehicleDataLoadingState extends DataState {}
class GetDriverVehicleDataSuccessState extends DataState {}
class GetDriverVehicleDataErrorState extends DataState {}

class AcceptTripLoadingState extends DataState {}
class AcceptTripSuccessState extends DataState {}
class AcceptTripCompleteSuccessState extends DataState {}
class AcceptTripErrorState extends DataState {}


class AcceptLessPriceTripLoadingState extends DataState {}
class AcceptLessPriceTripSuccessState extends DataState {}
class AcceptLessPriceTripCompleteSuccessState extends DataState {}
class AcceptLessPriceTripErrorState extends DataState {}

class ArrivedAtLocationLoadingState extends DataState {}
class ArrivedAtLocationSuccessState extends DataState {}
class ArrivedAtLocationCompleteSuccessState extends DataState {}
class ArrivedAtLocationErrorState extends DataState {}

class StartTripLoadingState extends DataState {}
class StartTripSuccessState extends DataState {}
class StartTripCompleteSuccessState extends DataState {}
class StartTripErrorState extends DataState {}

class EndTripLoadingState extends DataState {}
class EndTripSuccessState extends DataState {}
class EndTripErrorState extends DataState {}

class CancelTripLoadingState extends DataState {}
class CancelTripSuccessState extends DataState {}
class CancelTripErrorState extends DataState {}

class ChangeDriverStatusLoadingState extends DataState {}
class ChangeDriverStatusSuccessState extends DataState {}
class ChangeDriverStatusErrorState extends DataState {
  final String error;
  ChangeDriverStatusErrorState(this.error);
}

class GetTripsHistoryDataLoadingState extends DataState {}
class GetTripsHistoryDataSuccessState extends DataState {}
class GetTripsHistoryDataErrorState extends DataState {}



class CheckStatusState extends DataState {}