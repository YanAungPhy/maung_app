import 'package:two_d/bloc/singup_bloc/bloc/singup_bloc.dart';
import 'package:two_d/utils/global_import.dart';

import '../app_page/app_page.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController pass2Controller = TextEditingController();
  final TextEditingController nameController = TextEditingController();
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
                      "Singup",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: Colors.teal),
                    ),
                    Text(
                      "အကောင့်သစ်လုပ်ပါ",
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
                          return "Name cannot be empty";
                        }
                        return null;
                      },
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.person_rounded,
                          color: Colors.teal,
                        ),
                        contentPadding: const EdgeInsets.all(5),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "eg : Jole",
                        label: const Text("နာမည်ထည့်ပါ"),
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
                          return "ဖုန်းနံပါတ်အလွတ်မဖြစ်ရ";
                        }
                        if (value.length < 6) {
                          return "အနည်းဆုံး ၆ လုံးထည့်ပါ";
                        }
                        return null;
                      },
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.phone_rounded,
                          color: Colors.teal,
                        ),
                        contentPadding: const EdgeInsets.all(5),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "09.....",
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
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "စကားဝှက်ထည့်ပါ";
                        }
                        if (value.length < 6) {
                          return "အနည်းဆုံး ၆ လုံးထည့်ပါ";
                        }
                        if (value.toString() != passController.text) {
                          return "စကားဝှက် ၂ ခု တူရမည်";
                        }
                        return null;
                      },
                      obscureText: showPassword,
                      controller: pass2Controller,
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
                        hintText: "စကားဝှက်ပြန်‌ထည့်ပါ",
                        label: const Text("စကားဝှက်ပြန်‌ထည့်ပါ"),
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
                    BlocConsumer<SingupBloc, SingupState>(
                      builder: (context, state) {
                        if (state is SingupILoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return Center(
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<SingupBloc>(context).add(
                                      TapSingupEvent(
                                          name: nameController.text,
                                          phone: phoneController.text,
                                          password: passController.text));
                                }
                                null;
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal,
                                  fixedSize: const Size(150, 30)),
                              child: const Text("အကောင့်ဖွင့်မည်"),
                            ),
                          );
                        }
                      },
                      listener: (context, state) {
                        if (state is SingupSuccess) {
                          context.left(const AppPage());
                        }
                        if (state is SingupFail) {
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
                      height: size.height * 0.05,
                    ),
                    Divider(
                      thickness: 1.0,
                      height: size.height * 0.05,
                      color: Colors.white38,
                    ),
                    const Center(
                      child: Text(
                        "HAVE AN ACCOUNT !",
                        style: TextStyle(
                            color: Colors.white38,
                            // fontSize: 16,
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
            context.back();
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                    text: "အကောင့်ရှိပြီးသားလား ?   ",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'ဝင်ရန်',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.tealAccent),
                      )
                    ])),
          ),
        ),
      ),
    );
  }
}
