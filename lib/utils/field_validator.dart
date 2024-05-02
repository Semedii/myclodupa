class FieldValidators {
  static String? required(value) {
    if (value == null || value.isEmpty) {
      return "Please fill this field";
    }
    return null;
  }
}