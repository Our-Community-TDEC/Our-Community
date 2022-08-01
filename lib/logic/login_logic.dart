class Login_Logic {
  void signInButtonPressed(String email, String pass) {
    // print("Hoi! A button was PRESSED!!!!!!!!!!!!!!!!!!");
    print("MailID: $email");
    print("Passwd: $pass");

    if(emailValidityTest(email))
      print("Ok");
    else
      print("There is an issue");

    print(email.indexOf('@'));
    print(email.lastIndexOf('.'));
  }

  bool emailValidityTest(String email) {
    if(email.indexOf(' ') == -1)
      if(email.indexOf('@') != -1)
        if(email.lastIndexOf('.') > email.indexOf('@'))
          return true;

    return false;
  }
}
