bool isEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);
  return regExp.hasMatch(em);
}

bool isPassword(String password) {
  var strongRegex = new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{6,})");
  if (strongRegex.hasMatch(password)) {
    return true;
  } else {
    return false;
  }
}

bool isNull(String value) {
  if (value.isEmpty || value == null) {
    return false;
  } else {
    return true;
  }
}

bool isLength(String value) {
  if (value.length <= 2)
    return false;
  else
    return true;
}

bool checkString(String value) {
  if (value.contains(new RegExp(r'^[a-zA-Z]'))) {
    return true;
  } else
    return false;
}
