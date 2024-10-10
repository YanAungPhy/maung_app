import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:two_d/models/response_model.dart';
import 'package:two_d/network/repository/service_phone_repo.dart';

import '../../../models/service_phone_model.dart';

part 'service_phone_event.dart';
part 'service_phone_state.dart';

class ServicePhoneBloc extends Bloc<ServicePhoneEvent, ServicePhoneState> {
  final ServicePhoneRepoImpl _servicePhoneRepoImpl;
  ServicePhoneBloc(this._servicePhoneRepoImpl) : super(ServicePhoneInitial()) {
    on<ServicePhoneEvent>((event, emit) {});
    on<TapServicePhoneEvent>((event, emit) async {
      emit(ServicePhoneLoading());
      ResponseModel responseModel =
          await _servicePhoneRepoImpl.getServicePhone();

      if (responseModel.msgState == MsgState.data) {
        ServicePhoneModel servicePhoneModel =
            ServicePhoneModel.fromJson(responseModel.data);
        emit(ServicePhoneSuccess(servicePhoneModel: servicePhoneModel));
      } else if (responseModel.msgState == MsgState.error) {
        String error = responseModel.data;
        emit(ServicePhoneFail(error: error));
      }
    });
  }
}
