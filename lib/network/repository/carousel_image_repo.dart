import '../../models/response_model.dart';
import '../api_service.dart';

abstract class CarouselImageRepo {
  Future<ResponseModel> getcarouselImg();
}

class CarouselImageRepoImpl implements CarouselImageRepo {
  final ApiService apiService;
  CarouselImageRepoImpl(this.apiService);

  @override
  Future<ResponseModel> getcarouselImg() async {
    return await apiService.getReq("all-slider-images");
  }
}
