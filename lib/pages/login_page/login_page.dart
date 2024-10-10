import 'package:two_d/bloc/login_bloc/bloc/login_bloc.dart';
import 'package:two_d/bloc/singup_bloc/bloc/singup_bloc.dart';
import 'package:two_d/pages/app_page/app_page.dart';
import 'package:two_d/pages/login_page/singup_page.dart';
import 'package:two_d/utils/global_import.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bg.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: Colors.teal),
                    ),
                    Text(
                      "သင့်အကောင့်ကိုဝင်ပါ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.teal),
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ဖုန်းနံပါတ်အလွတ်မဖြစ်ရ";
                        }
                        if (value.length < 6) {
                          return "အနည်းဆုံး ၆ လုံးထည့်ပါ";
                        }
                        return null;
                      },
                      controller: phoneController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.phone_rounded,
                          color: Colors.teal,
                        ),
                        contentPadding: const EdgeInsets.all(5),
                        filled: true,
                        hintText: "09.....",
                        fillColor: Colors.white,
                        label: const Text("ဖုန်းနံပါတ်ထည့်ပါ"),
                        floatingLabelStyle: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.teal),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: Colors.teal, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: Colors.teal, width: 2.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "စကားဝှက်အလွတ်မဖြစ်ရ";
                        }
                        if (value.length < 6) {
                          return "အနည်းဆုံး ၆ လုံးထည့်ပါ";
                        }
                        return null;
                      },
                      obscureText: showPassword,
                      controller: passController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.password_rounded,
                          color: Colors.teal,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            if (showPassword) {
                              showPassword = false;
                            } else {
                              showPassword = true;
                            }
                            setState(() {});
                          },
                          child: Icon(
                            !showPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.grey,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(5),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "စကားဝှက်ထည့်ပါ",
                        label: const Text("စကားဝှက်ထည့်ပါ"),
                        floatingLabelStyle: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.teal),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: Colors.teal, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: Colors.teal, width: 2.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    BlocConsumer<LoginBloc, LoginState>(
                      builder: (context, state) {
                        if (state is LoginLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return Center(
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<LoginBloc>(context).add(
                                      TapLoginEvent(
                                          phone: phoneController.text,
                                          password: passController.text));
                                }
                                null;
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal,
                                  fixedSize: const Size(150, 30)),
                              child: const Text("ဝင်မည်"),
                            ),
                          );
                        }
                      },
                      listener: (context, state) {
                        if (state is LoginSuccess) {
                          context.left(const AppPage());
                        }
                        if (state is LoginFail) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text(
                                    "မအောင်မြင်ပါ",
                                    style: TextStyle(color: AppColor.red),
                                  ),
                                  content: Text(state.error),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        context.back();
                                      },
                                      child: const Text("Ok"),
                                    ),
                                  ],
                                );
                              });
                        }
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.13,
                    ),
                    Divider(
                      thickness: 1.0,
                      height: size.height * 0.05,
                      color: Colors.white38,
                    ),
                    const Center(
                      child: Text(
                        "NEW USER !",
                        style: TextStyle(
                            color: Colors.white38,
                            wordSpacing: 5,
                            letterSpacing: 3,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            context.go(BlocProvider<SingupBloc>(
              create: (context) => SingupBloc(getIt.call()),
              child: const SingUpPage(),
            ));
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                text: "အကောင့်မရှိသေးဘူးလား ?    ",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: 15),
                children: <InlineSpan>[
                  TextSpan(
                    text: 'ဒီမှာဖွင့်ပါ',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.tealAccent),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
