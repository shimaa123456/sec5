class MyValidation {
  String? nameValidate(String? input) {
    //correct pattern
    if ((input?.toLowerCase().startsWith("a") ?? false) && (input?.length ?? 0) > 4) {
      return null;
    }
    //incorrect patern
    return "invalid name";
  }
}
