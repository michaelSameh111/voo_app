part of 'data_cubit.dart';

@immutable
sealed class DataState {}

final class DataInitial extends DataState {}
class GetVehicleTypesLoadingState extends DataState {}
class GetVehicleTypesSuccessState extends DataState {}
class GetVehicleTypesErrorState extends DataState {}