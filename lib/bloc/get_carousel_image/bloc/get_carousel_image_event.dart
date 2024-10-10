part of 'get_carousel_image_bloc.dart';

abstract class GetCarouselImageEvent extends Equatable {
  const GetCarouselImageEvent();

  @override
  List<Object> get props => [];
}

class TapGetCarouselImageEvent extends GetCarouselImageEvent {}
