abstract class CustomFunction {
  static bool isValidEmail(String value) {
    final trimmedValue = value.trim();

    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegex.hasMatch(trimmedValue)) {
      return false;
    }

    return true;
  }

  static bool isEmpty(String value) {
    final trimmedValue = value.trim();
    return trimmedValue.isNotEmpty;
  }
}
