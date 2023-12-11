class ValidationHelper {
  static String? validateEmpty(String? value, {String? errorMessage}) {
    if (value?.isEmpty ?? true) {
      return errorMessage ?? 'Please insert something';
    }
    return null;
  }
}
