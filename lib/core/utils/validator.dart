class Validator {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
      // } else if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(value)) {
      //   return 'Password must contain at least one uppercase letter';
      // } else if (!RegExp(r'^(?=.*?[a-z])').hasMatch(value)) {
      //   return 'Password must contain at least one lowercase letter';
    } else if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value)) {
      return 'Password must contain at least one number';
      // } else if (!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(value)) {
      //   return 'Password must contain at least one special character';
    }
    return null;
  }
}
