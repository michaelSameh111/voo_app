part of 'data_cubit.dart';

@immutable
sealed class DataState {}

final class DataInitial extends DataState {}
class GetVehicleTypesLoadingState extends DataState {}
class GetVehicleTypesSuccessState extends DataState {}
class GetVehicleTypesErrorState extends DataState {}


class GetLicenseDataLoadingState extends DataState {}
class GetLicenseDataSuccessState extends DataState {}
class GetLicenseDataErrorState extends DataState {}

class GetInsuranceDataLoadingState extends DataState {}
class GetInsuranceDataSuccessState extends DataState {}
class GetInsuranceDataErrorState extends DataState {}


class GetDriverDataLoadingState extends DataState {}
class GetDriverDataSuccessState extends DataState {}
class GetDriverDataErrorState extends DataState {}