part of 'service_phone_bloc.dart';

abstract class ServicePhoneEvent extends Equatable {
  const ServicePhoneEvent();

  @override
  List<Object> get props => [];
}

class TapServicePhoneEvent extends ServicePhoneEvent {}
