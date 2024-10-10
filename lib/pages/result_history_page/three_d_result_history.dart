import 'package:two_d/models/three_d_result_model.dart';
import 'package:two_d/utils/global_import.dart';

import '../../bloc/three_d_result_bloc/bloc/three_d_result_bloc.dart';
import '../error_page/error_page.dart';

class ThreeDResultHistory extends StatelessWidget {
  const ThreeDResultHistory({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ThreeDResultBloc>(context).add(TapThreeDResultEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text("3D မှတ်တမ်းများ"),
        backgroundColor: AppColor.white,
        foregroundColor: AppColor.greenBlack,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              context.back();
            },
            icon: const Icon(Icons.close)),
      ),
      body: BlocBuilder<ThreeDResultBloc, ThreeDResultState>(
        builder: (context, state) {
          if (state is ThreeDResultSuccess) {
            List<ThreeDResultModel> threeDResultList = state.threeDResultList;
            return successWidget(threeDResultList);
          } else if (state is ThreeDResultFail) {
            return ErrorPage(error: state.error);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget successWidget(List<ThreeDResultModel> threeDResultList) {
    return ListView.builder(
        itemCount: threeDResultList.length,
        itemBuilder: (context, index) {
          return Card(
            color: AppColor.greenDark,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    threeDResultList[index].datetime!,
                    style: const TextStyle(
                        color: AppColor.cyber,
                        fontSize: 18,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    threeDResultList[index].result!,
                    style: const TextStyle(
                        color: AppColor.yellow,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
