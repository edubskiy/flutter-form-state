class ValidationMixin {
  String validateEmail(String value) {
    if (!value.contains('@')) {
      return 'Please ener a valid email';
    }

    return null;
  }

  String validatePassword(String value) {
    if (value.length < 4) {
      return 'Please ener a password at least 4 characters';
    }

    return null;
  }
}
