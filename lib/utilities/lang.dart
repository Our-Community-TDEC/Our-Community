class Lang {
  static String text(String data, int lang) {
    if (data == "login") if (lang == 0) return "LogIn Page";
    if (data == "login") if (lang == 1) return "મને ઓળખો";

    if (data == "wcm") if (lang == 0) return "Welcome to our community";
    if (data == "wcm") if (lang == 1)
      return "Our community માં આપનું સ્વાગત છે";

    if (data == "lgs") if (lang == 0) return "Let's Get started";
    if (data == "lgs") if (lang == 1) return "ચાલો શરુ કરીએ";

    if (data == "gs") if (lang == 0) return "Get started";
    if (data == "gs") if (lang == 1) return "શરુ કરો";

    return "";
  }
}
