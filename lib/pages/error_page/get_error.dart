class GetError {
  static String getError({required String error}) {
    String imgName;

    switch (error) {
      case "အင်တာနက်မရှိပါ":
        imgName = "images/internet.png";
        break;
      case "Not Found Error":
        imgName = "images/404.png";
        break;
      case "Internal Server Error":
        imgName = "images/internal.png";
        break;
      case "Unknown Error":
        imgName = "images/error.png";
        break;
        case "မှတ်တမ်းမရှိပါ":
        imgName = "images/empty.png";
        break;
      default:
        imgName = "images/error.png";
        break;
    }
    return imgName;
  }
}
