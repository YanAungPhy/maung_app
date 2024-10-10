part of 'service_phone_bloc.dart';

abstract class ServicePhoneState extends Equatable {
  const ServicePhoneState();

  @override
  List<Object> get props => [];
}

class ServicePhoneInitial extends ServicePhoneState {}

class ServicePhoneLoading extends ServicePhoneState {}

class ServicePhoneSuccess extends ServicePhoneState {
  final ServicePhoneModel servicePhoneModel;
  const ServicePhoneSuccess({required this.servicePhoneModel});

  @override
  List<Object> get props => [servicePhoneModel];
}

class ServicePhoneFail extends ServicePhoneState {
  final String error;

  const ServicePhoneFail({required this.error});
}
