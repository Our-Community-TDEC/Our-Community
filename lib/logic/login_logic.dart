// ignore_for_file: avoid_print

class Login_Logic {
  void signInButtonPressed(String email, String pass) {
    print("MailID: $email");
    print("Passwd: $pass");

    if (emailValidityTest(email))
      print("Ok");
    else
      print("There is an issue");

    print(email.indexOf('@'));
    print(email.lastIndexOf('.'));

    if (verify("aksh.d.4002@gmail.com", "Aksh1234;")) {
      print("Username and Password ok\nTaking you to next page...\nNew");
    } else {
      print("Something wrong.\nPlease try again.");
    }

    print(verify(email, pass));
  }

  bool emailValidityTest(String email) {
    if (email.indexOf(' ') == -1) if (email.indexOf('@') !=
        -1) if (email.lastIndexOf('.') > email.indexOf('@')) return true;

    return false;
  }

  bool verify(String email, String pass) {
    print("I got email as: $email");
    print("I got passw as: $pass ");
    if (email == "aksh.d.4002@gmail.com") if (pass == "Aksh1234") return true;
    return false;
  }
}
