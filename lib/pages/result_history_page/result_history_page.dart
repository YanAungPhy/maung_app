import 'package:two_d/bloc/twod_history/bloc/twod_history_bloc.dart';
import 'package:two_d/models/twod_history_model.dart';
import 'package:two_d/pages/error_page/error_page.dart';
import 'package:two_d/utils/global_import.dart';

class ResultHistoryPage extends StatelessWidget {
  const ResultHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<TwodHistoryBloc>(context).add(TapTwodHistoryEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text("2D မှတ်တမ်းများ"),
        backgroundColor: AppColor.white,
        foregroundColor: AppColor.greenBlack,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              context.back();
            },
            icon: const Icon(Icons.close)),
      ),
      body: BlocBuilder<TwodHistoryBloc, TwodHistoryState>(
        builder: (context, state) {
          if (state is TwodHistorySuccess) {
            List<TwoDHistoryModel> resultList = state.twodHistoryModelList;
            return ListView.builder(
                itemCount: resultList.length,
                itemBuilder: (context, index) {
                  return successWidget(resultList[index]);
                });
          } else if (state is TwodHistoryFail) {
            return ErrorPage(error: state.error);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget successWidget(TwoDHistoryModel resultList) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColor.blue,
            boxShadow: const [
              BoxShadow(
                  color: AppColor.grey, offset: Offset(3, 5), blurRadius: 5),
            ],
          ),
          child: Text(
            resultList.date!,
            style: const TextStyle(
                color: AppColor.white,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic),
          ),
        ),
        Card(
          color: AppColor.greenDark,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  "12:01 PM",
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: AppColor.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Set",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          resultList.set1200!,
                          style: const TextStyle(
                            color: AppColor.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "Val",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          resultList.val1200!,
                          style: const TextStyle(
                            color: AppColor.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "2D",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          resultList.result1200!,
                          style: const TextStyle(
                            color: AppColor.yellow,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          color: AppColor.greenDark,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  "40:00 PM",
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: AppColor.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Set",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          resultList.set430!,
                          style: const TextStyle(
                            color: AppColor.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "Val",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          resultList.val430!,
                          style: const TextStyle(
                            color: AppColor.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "2D",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          resultList.result430!,
                          style: const TextStyle(
                            color: AppColor.yellow,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          color: AppColor.greenDark,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  "09:30 AM",
                  style: TextStyle(
                    color: AppColor.cyber,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: AppColor.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Modern",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          resultList.modern930!,
                          style: const TextStyle(
                            color: AppColor.cyber,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "Internet",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          resultList.internet930!,
                          style: const TextStyle(
                            color: AppColor.cyber,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "11:00 AM",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          resultList.result1100!,
                          style: const TextStyle(
                            color: AppColor.cyber,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          color: AppColor.greenDark,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  "02:00 PM",
                  style: TextStyle(
                    color: AppColor.cyber,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: AppColor.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "Modern",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          resultList.modern200!,
                          style: const TextStyle(
                            color: AppColor.cyber,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "Internet",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          resultList.internet200!,
                          style: const TextStyle(
                            color: AppColor.cyber,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "03:00 PM",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          resultList.result300!,
                          style: const TextStyle(
                            color: AppColor.cyber,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
