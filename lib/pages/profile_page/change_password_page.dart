import 'package:two_d/bloc/change_password/bloc/change_password_bloc.dart';
import 'package:two_d/utils/global_import.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController oldPassController= TextEditingController();
  final TextEditingController newPassController= TextEditingController();
  final TextEditingController newPassController2= TextEditingController();
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("စကားဝှက်ပြောင်းလဲမှု"),
        backgroundColor: AppColor.white,
        foregroundColor: AppColor.greenBlack,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              context.back();
            },
            icon: const Icon(Icons.close)),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
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
                  controller: oldPassController,
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
                        !showPassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(5),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "စကားဝှက်ဟောင်းထည့်ပါ",
                    label: const Text("စကားဝှက်ဟောင်းထည့်ပါ"),
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
                  controller: newPassController,
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
                        !showPassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(5),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "စကားဝှက်အသစ်ထည့်ပါ",
                    label: const Text("စကားဝှက်အသစ်ထည့်ပါ"),
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
                    if (value.toString() != newPassController.text) {
                      return "စကားဝှက်အသစ် ၂ ခု တူရမည်";
                    }
                    return null;
                  },
                  obscureText: showPassword,
                  controller: newPassController2,
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
                        !showPassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(5),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "စကားဝှက်အသစ်ပြန်‌ရေးပါ",
                    label: const Text("စကားဝှက်အသစ်ပြန်‌ရေးပါ"),
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
                BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
                  builder: (context, state) {
                    if (state is ChangePasswordLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<ChangePasswordBloc>(context).add(
                                  TapChangePasswordEvent(
                                      newPassword: newPassController.text,
                                      oldPassword: oldPassController.text));
                            }
                            null;
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              fixedSize: const Size(150, 30)),
                          child: const Text("Login"),
                        ),
                      );
                    }
                  },
                  listener: (context, state) {
                    if (state is ChangePasswordSuccess) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                "အောင်မြင်ပါသည်",
                                style: TextStyle(color: AppColor.greenPrimary),
                              ),
                              content:
                                  const Text("စကားဝှက်ပြောင်းလဲခြင်းပြီးပါပြီ"),
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
                    if (state is ChangePasswordFail) {
                      String error = state.error == "Old password does not match." ? "စကားဝှက်ဟောင်းမှားယွင်းနေပါသည်" : state.error ;

                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                "မအောင်မြင်ပါ",
                                style: TextStyle(color: AppColor.red),
                              ),
                              content: Text(error),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
