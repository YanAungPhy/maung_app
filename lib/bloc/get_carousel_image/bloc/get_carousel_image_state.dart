part of 'get_carousel_image_bloc.dart';

abstract class GetCarouselImageState extends Equatable {
  const GetCarouselImageState();

  @override
  List<Object> get props => [];
}

class GetCarouselImageInitial extends GetCarouselImageState {}

class GetCarouselImageLoading extends GetCarouselImageState {}

class GetCarouselImageSuccess extends GetCarouselImageState {
  final List<CarouselImgModel> carouselImgList;

  const GetCarouselImageSuccess({required this.carouselImgList});

  @override
  // TODO: implement props
  List<Object> get props => [carouselImgList];
}

class GetCarouselImageFail extends GetCarouselImageState {
  final String error;

  const GetCarouselImageFail({required this.error});

  @override
  List<Object> get props => [error];
}
