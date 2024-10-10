import '../../utils/global_import.dart';

class ColorHelper {
  static Color getColor({required String status}) {
    Color color;

    switch (status) {
      case "On_Progress":
        color = AppColor.blue;
        break;
      case "Confirm":
        color = AppColor.win;
        break;
      case "Reject":
        color = AppColor.red;
        break;
      default:
        color = AppColor.blue;
        break;
    }
    return color;
  }

  static String getText({required String status}) {
    String text;

    switch (status) {
      case "On_Progress":
        text = "ဆောင်ရွက်နေဆဲ";
        break;
      case "Confirm":
        text = "အတည်ပြုပြီး";
        break;
      case "Reject":
        text = "ငြင်းပါယ်သည်";
        break;
      default:
        text = "ဆောင်ရွက်နေဆဲ";
        break;
    }
    return text;
  }
}
