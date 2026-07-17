class Validators {
  Validators._();
  static String? emailValidator(String? v) {
    if (v == null || v.trim().isEmpty) return 'Email is required';
    final emailRx = RegExp(r'^[\w\.\-]+@([\w\-]+\.)+[\w\-]{2,4}$');
    if (!emailRx.hasMatch(v.trim())) return 'Enter a valid email';
    return null;
  }

  static String? validatorPhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone Number is Require";
    }
    final phoneRegExp = RegExp(r'"\d{10}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid Phone Number Format (10 digits required)';
    }
    return null;
  }

  static String? validatorUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Username is required";
    }
    final usernameRegExp = RegExp(r'^[a-zA-Z][a-zA-Z0-9_]{2,19}$');
    if (!usernameRegExp.hasMatch(value.trim())) {
      return "Username must start with a letter and contain only letters, numbers, or underscores (3-20 characters)";
    }
    return null;
  }

  static String? passwordValidator(String? v) {
    if (v == null || v.isEmpty) return 'Password is required';
    if (v.length < 6) return 'Use at least 6 characters';
    return null;
  }

  static String? nameValidator(String? v) {
    if (v == null || v.trim().isEmpty) return 'Name is required';
    if (v.trim().length < 2) return 'Enter a valid name';
    return null;
  }
}
