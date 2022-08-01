class Login_Logic {
  void signInButtonPressed(String email, String pass) {
    // print("Hoi! A button was PRESSED!!!!!!!!!!!!!!!!!!");
    print("MailID: $email");
    print("Passwd: $pass");

    if(email.indexOf('@') != -1)
      if(email.lastIndexOf('.') > email.indexOf('@'))
        print("ok");
      else
        print("Not ok");
    else
      print("Not ok");

    print(email.indexOf('@'));
    print(email.lastIndexOf('.'));
  }
}
