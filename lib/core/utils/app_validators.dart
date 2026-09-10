class AppValidators {
  static String? validateEmail(String? val) {
    if (val == null || val.isEmpty) {
      return "Email is required.";
    }

    if (!RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$",
    ).hasMatch(val)) {
      return "Please enter a valid email address.";
    }

    return null;
  }

  static String? validatePassword(String? val) {
    if (val == null || val.isEmpty) {
      return "Password is required";
    }

    if (val.length < 8 ||
        !RegExp(r'[A-Z]').hasMatch(val) ||
        !RegExp(r'[a-z]').hasMatch(val) ||
        !RegExp(r'[!@#\$&*~_=%^]+').hasMatch(val)) {
      return "Password must be at least 8 characters \nand include at least one uppercase letter, one \nlowercase letter, and one special character.";
    }

    return null;
  }
}
