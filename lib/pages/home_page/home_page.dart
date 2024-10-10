import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:two_d/bloc/get_carousel_image/bloc/get_carousel_image_bloc.dart';
import 'package:two_d/bloc/get_user/bloc/get_user_bloc.dart';
import 'package:two_d/bloc/twod_history/bloc/twod_history_bloc.dart';
import 'package:two_d/pages/bawdi_page/bawdi_page.dart';
import 'package:two_d/pages/error_page/error_page.dart';
import 'package:two_d/pages/maung_page/maung_page.dart';
import 'package:two_d/pages/result_history_page/result_history_page.dart';
import 'package:two_d/pages/result_history_page/three_d_result_history.dart';
import 'package:two_d/pages/three_d_page/three_d_page.dart';
import 'package:two_d/pages/two_d_page/two_d_page.dart';
import 'package:two_d/utils/global_import.dart';

import '../../bloc/three_d_result_bloc/bloc/three_d_result_bloc.dart';
import '../../bloc/win_num_bloc/bloc/win_num_bloc.dart';
import '../../models/auth_model.dart';
import '../../models/carousel_image_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imgList = [];
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetUserBloc>(
          create: (context) =>
              GetUserBloc(getIt.call())..add(TapGetUserEvent()),
        ),
        BlocProvider<GetCarouselImageBloc>(
          create: (context) => GetCarouselImageBloc(getIt.call())
            ..add(TapGetCarouselImageEvent()),
        ),
        BlocProvider<WinNumBloc>(
          create: (context) => WinNumBloc(getIt.call())..add(TapWinNumEvent()),
        )
      ],
      child: BlocBuilder<GetUserBloc, GetUserState>(
        builder: (context, state) {
          if (state is GetUserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetUserSuccess) {
            return SafeArea(
              child: bodyWidget(state.userModel, size),
            );
          } else if (state is GetUserFail) {
            return Container(
                width: double.infinity,
                height: double.infinity,
                color: AppColor.nearlywhite.withOpacity(.5),
                child: ErrorPage(error: state.error));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget bodyWidget(UserModel userModel, Size size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          headerWidget(userModel),
          carouselImageWidget(),
          winNum(size),
          const SizedBox(
            height: 30,
          ),
          footballWidget(size, userModel),
          const SizedBox(
            height: 30,
          ),
          lottoryWidget(size, userModel),
        ],
      ),
    );
  }

  Widget footballWidget(Size size, UserModel userModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            context.go(const BawDiPage());
          },
          child: Container(
            width: size.width * 0.35,
            height: 130,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.white54,
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      'images/football.png',
                      height: 80,
                    )),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(.5),
                      borderRadius: const BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(13),
                        bottomStart: Radius.circular(13),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "BawDi",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            context.go(const MaungPage());
          },
          child: Container(
            width: size.width * 0.35,
            height: 130,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.white54,
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      'images/football.png',
                      height: 80,
                    )),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(.5),
                      borderRadius: const BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(13),
                        bottomStart: Radius.circular(13),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Maung",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget headerWidget(UserModel userModel) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              text: "Welcome, ",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
              children: [
                TextSpan(
                  text: userModel.name,
                  style: const TextStyle(
                      color: Colors.tealAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              text: "လက်ကျန် : ",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
              children: [
                TextSpan(
                  text: userModel.balance.toString(),
                  style: const TextStyle(
                      color: Colors.tealAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget lottoryWidget(Size size, UserModel userModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            context.go(TwoDPage(
              balance: userModel.balance.toString(),
            ));
          },
          child: Container(
            width: size.width * 0.35,
            height: 130,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.white54,
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "images/icons/2balls.png",
                    height: 80,
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(.5),
                      borderRadius: const BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(13),
                        bottomStart: Radius.circular(13),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Myanmar 2D",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            context.go(ThreeDPage(
              balance: userModel.balance.toString(),
            ));
          },
          child: Container(
            width: size.width * 0.35,
            height: 130,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.white54,
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "images/icons/3ball.png",
                    height: 80,
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.teal.withOpacity(.5),
                      borderRadius: const BorderRadiusDirectional.only(
                        bottomEnd: Radius.circular(13),
                        bottomStart: Radius.circular(13),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Myanmar 3D",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget winNum(Size size) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      width: size.width * 0.9,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(.3),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.teal, width: 2),
      ),
      child: Column(
        children: [
          const Text(
            "Latest 2D Results",
            style: TextStyle(
                color: Colors.white, fontSize: 19, fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "Morning (12:01 AM)    -",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Afternoon (04:30 PM)    -",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  BlocBuilder<WinNumBloc, WinNumState>(
                    builder: (context, state) {
                      if (state is WinNumClose) {
                        return FittedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "ယာယီပိတ်ထားသည်",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "ယာယီပိတ်ထားသည်",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        );
                      } else if (state is WinNumSuccess) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.winNumModel.data!.result1200!.toString(),
                              style: const TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              state.winNumModel.data!.result430!.toString(),
                              style: const TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        );
                      } else if (state is WinNumFail) {
                        return Text(
                          state.error,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: AppColor.nearlywhite,
                                  strokeWidth: 2,
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: AppColor.nearlywhite,
                                  strokeWidth: 2,
                                )),
                          ],
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          const Divider(
            height: 5,
            thickness: 1,
            color: AppColor.grey,
          ),
          FittedBox(
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FittedBox(
                    child: TextButton(
                      onPressed: () {
                        context.go(BlocProvider<ThreeDResultBloc>(
                          create: (context) => ThreeDResultBloc(getIt.call()),
                          child: const ThreeDResultHistory(),
                        ));
                      },
                      child: const Text(
                        "3D မှတ်တမ်းကြည့်ရန်",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          decorationStyle: TextDecorationStyle.wavy,
                          color: AppColor.cyber,
                        ),
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    thickness: 1,
                    color: AppColor.grey,
                  ),
                  FittedBox(
                    child: TextButton(
                      onPressed: () {
                        context.go(BlocProvider<TwodHistoryBloc>(
                          create: (context) => TwodHistoryBloc(getIt.call()),
                          child: const ResultHistoryPage(),
                        ));
                      },
                      child: const Text(
                        "2D မှတ်တမ်းကြည့်ရန်",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          decorationStyle: TextDecorationStyle.wavy,
                          color: AppColor.cyber,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget carouselImageWidget() {
    return BlocBuilder<GetCarouselImageBloc, GetCarouselImageState>(
      builder: (context, state) {
        if (state is GetCarouselImageLoading) {
          return const CircularProgressIndicator();
        } else if (state is GetCarouselImageSuccess) {
          List<CarouselImgModel> cim = state.carouselImgList;
          if (cim.isEmpty) return Container();
          return Stack(
            children: [
              CarouselSlider.builder(
                itemCount: cim.length,
                carouselController: _controller,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.tealAccent, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: CachedNetworkImage(
                        imageUrl: cim[itemIndex].link!,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Expanded(
                            child: Center(child: Icon(Icons.error))),
                      ),
                    ),
                  ),
                ),
                options: CarouselOptions(
                  autoPlay: true,
                  height: 180,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  aspectRatio: 16 / 9,
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: cim.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 4),
                          child: Material(
                            elevation: 3,
                            borderRadius: BorderRadius.circular(25),
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              width: 13.0,
                              height: 7.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: (Colors.teal).withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          );
        } else if (state is GetCarouselImageFail) {
          return Text(state.error);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
