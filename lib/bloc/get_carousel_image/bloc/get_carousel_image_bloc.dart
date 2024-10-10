import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:two_d/models/carousel_image_model.dart';

import '../../../models/response_model.dart';
import '../../../network/repository/carousel_image_repo.dart';

part 'get_carousel_image_event.dart';
part 'get_carousel_image_state.dart';

class GetCarouselImageBloc
    extends Bloc<GetCarouselImageEvent, GetCarouselImageState> {
  final CarouselImageRepoImpl _carouselImageRepoImpl;
  GetCarouselImageBloc(this._carouselImageRepoImpl)
      : super(GetCarouselImageInitial()) {
    on<GetCarouselImageEvent>((event, emit) {});
    on<TapGetCarouselImageEvent>((event, emit) async {
      emit(GetCarouselImageLoading());
      ResponseModel responseModel =
          await _carouselImageRepoImpl.getcarouselImg();
      if (responseModel.msgState == MsgState.data) {
        List<CarouselImgModel> carouselImgList = (responseModel.data as List)
            .map((e) => CarouselImgModel.fromJson(e))
            .toList();

        emit(GetCarouselImageSuccess(carouselImgList: carouselImgList));
      } else if (responseModel.msgState == MsgState.error) {
        String error = responseModel.data;
        emit(GetCarouselImageFail(error: error));
      }
    });
  }
}
