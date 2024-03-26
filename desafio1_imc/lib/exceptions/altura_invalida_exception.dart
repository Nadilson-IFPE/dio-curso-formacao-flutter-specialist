class AlturaInvalidaException implements Exception {
  String error() => "Altura inválida";

  @override
  String toString() {
    return "AlturaInvalidaException: ${error()}";
  }
}
