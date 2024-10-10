import 'package:two_d/pages/error_page/get_error.dart';
import 'package:two_d/utils/global_import.dart';

class ErrorPage extends StatelessWidget {
  final String error;
  const ErrorPage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              GetError.getError(error: error),
              height: 250,
            ),
            const SizedBox(
              height: 25,
            ),
            Text(error),
          ],
        ),
      ),
    );
  }
}
