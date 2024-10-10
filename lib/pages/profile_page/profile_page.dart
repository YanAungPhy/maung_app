import 'package:two_d/bloc/change_password/bloc/change_password_bloc.dart';
import 'package:two_d/bloc/get_user/bloc/get_user_bloc.dart';
import 'package:two_d/bloc/service_phone_bloc/bloc/service_phone_bloc.dart';
import 'package:two_d/pages/login_page/login_page.dart';
import 'package:two_d/pages/profile_page/change_password_page.dart';
import 'package:two_d/pages/splash_page/splash_page.dart';
import 'package:two_d/utils/global_import.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../bloc/login_bloc/bloc/login_bloc.dart';
import '../../bloc/refresh_token/bloc/refresh_token_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetUserBloc>(context).add(TapGetUserEvent());
    BlocProvider.of<ServicePhoneBloc>(context).add(TapServicePhoneEvent());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.nearlywhite.withOpacity(.5),
      appBar: AppBar(
        backgroundColor: AppColor.greenBlack,
        leading: const Icon(Icons.person),
        title: const Text("ကိုယ်ရေးအကျဉ်း"),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: BlocBuilder<GetUserBloc, GetUserState>(
            builder: (context, state) {
              if (state is GetUserSuccess) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 30, top: 15, bottom: 15, right: 25),
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                          color: AppColor.nearlywhite, shape: BoxShape.circle),
                      child: const Icon(Icons.person),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.userModel.name!,
                          style: const TextStyle(
                            color: AppColor.nearlywhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "လက်ကျန် : ${state.userModel.balance.toString()} ကျပ်",
                          style: const TextStyle(
                            color: AppColor.nearlywhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          state.userModel.secretName.toString(),
                          style: const TextStyle(
                            color: AppColor.nearlywhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else if (state is GetUserFail) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.error,
                        color: AppColor.red,
                        size: 35,
                      ),
                      Text(
                        state.error,
                        style: const TextStyle(
                          color: AppColor.nearlywhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ),
      ),
      body: Container(
        color: AppColor.nearlywhite.withOpacity(.5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  context.go(BlocProvider<ChangePasswordBloc>(
                    create: (context) => ChangePasswordBloc(getIt.call()),
                    child: const ChangePasswordPage(),
                  ));
                },
                leading: const Icon(Icons.password),
                title: const Text("စကားဝှက်ပြောင်းရန်"),
                trailing: const Icon(Icons.chevron_right),
              ),
              const Divider(
                thickness: 1,
              ),
              ListTile(
                onTap: () {
                  SharedPref.saveData(key: ConstText.token, value: "null");
                  SharedPref.saveData(key: ConstText.refreshToken, value: "null");
                  context.left(
                    BlocProvider<LoginBloc>(
                      create: (context) => LoginBloc(getIt.call()),
                      child: const LoginPage(),
                    ),
                  );
                },
                leading: const Icon(
                  Icons.logout,
                  color: AppColor.red,
                ),
                title: const Text("ထွက်ရန်"),
                trailing: const Icon(Icons.chevron_right),
              ),
              const Divider(
                thickness: 1,
              ),
              const Text(
                "အောက်ပါဖုန်းနံပါတ်သည် ရွှေညီကို 2D 3D ကုမ္ပဏီ၏ ဝန်ဆောင်မှုဖုန်းနံပါတ်ဖြစ်သည် \nနေ့စဉ်(၂၄) နာရီ ၊ ပိတ်ရက်မရှိ ဝန်ဆောင်ပေးနေပါသည်။",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColor.greenBlack, fontSize: 14),
              ),
              Container(
                width: size.width * 0.8,
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.greenPrimary, width: 2),
                    borderRadius: BorderRadius.circular(15),
                    color: AppColor.greenSecondry.withOpacity(.5)),
                child: BlocBuilder<ServicePhoneBloc, ServicePhoneState>(
                  builder: (context, state) {
                    if (state is ServicePhoneLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is ServicePhoneSuccess) {
                      List<String> result =
                          state.servicePhoneModel.value!.split(',');
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("ဝန်ဆောင်မှုဖုန်းနံပါတ်"),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: result.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: (){
                                    launch('viber://chat/?number=${result[index]}');
        
                                    // html.window.open('viber://chat?number=xxx', ''); 
                                  },
                                  title: Text(
                                    result[index],
                                    style: const TextStyle(
                                        color: AppColor.greenBlack, fontSize: 18),
                                  ),
                                  trailing: ClipRRect(
                                    borderRadius: BorderRadius.circular(500.0),
                                    child: Image.asset(
                                      "images/vb2.png",
                                      height: 40,
                                    ),
                                  ),
                                );
                              }),
                        ],
                      );
                    }
                    if (state is ServicePhoneFail) {
                      return Text(state.error);
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
