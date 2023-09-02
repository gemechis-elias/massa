final RegExp _emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
bool isEmailValid(String email) {
  return _emailRegExp.hasMatch(email);
}
