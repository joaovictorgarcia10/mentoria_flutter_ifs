class AppValidadors {
  String? cepValidator(text) {
    if (text == null || text.isEmpty) {
      return "Este campo deve ser preenchido";
    }
    if (text.length != 9) {
      return "Preencha com um CEP válido";
    }
    return null;
  }
}
