import 'package:two_d/bloc/login_bloc/bloc/login_bloc.dart';
import 'package:two_d/bloc/refresh_token/bloc/refresh_token_bloc.dart';
import 'package:two_d/pages/app_page/app_page.dart';
import 'package:two_d/utils/global_import.dart';
import '../error_page/error_page.dart';
import '../login_page/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  _checkLogin() async {
    String? refreshToken =
        await SharedPref.getData(key: ConstText.refreshToken);
    if (refreshToken == null || refreshToken == "null") {
      Future.delayed(const Duration(seconds: 2), () {
        context.left(
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(getIt.call()),
            child: const LoginPage(),
          ),
        );
      });
    } else {
      BlocProvider.of<RefreshTokenBloc>(context)
          .add(TapRefreshTokenEvent(refreshToken: refreshToken));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/background.jpg"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "images/logo.jpg",
                  height: 150,
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              BlocConsumer<RefreshTokenBloc, RefreshTokenState>(
                listener: (context, state) {
                  if (state is RefreshTokenSuccess) {
                    context.left(const AppPage());
                  }
                },
                builder: (context, state) {
                  if (state is RefreshTokenInitial) {
                    _checkLogin();
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is RefreshTokenFail) {
                    return Center(
                        child: Text(
                      state.error,
                      style: const TextStyle(color: AppColor.white),
                    ));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
