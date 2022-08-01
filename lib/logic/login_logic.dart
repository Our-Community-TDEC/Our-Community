class Login_Logic {
  void signInButtonPressed(String email, String pass) {
    print("MailID: $email");
    print("Passwd: $pass");

    if(emailValidityTest(email))
      print("Ok");
    else
      print("There is an issue");

    print(email.indexOf('@'));
    print(email.lastIndexOf('.'));

    if(email == "aksh.d.4002@gmail.com" && pass == "Aksh1234;") {
      print("Username and Password ok\nTaking you to next page...");
    }
    else {
      print("Something wrong.\nPlease try again.");
    }
  }

  bool emailValidityTest(String email) {
    if(email.indexOf(' ') == -1)
      if(email.indexOf('@') != -1)
        if(email.lastIndexOf('.') > email.indexOf('@'))
          return true;

    return false;
  }
}
