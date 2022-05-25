class AppValidadors {
  String? cepValidator(String? text) {
    if (text == null || text.isEmpty) {
      return "Este campo deve ser preenchido";
    }
    if (text.length != 9) {
      return "Preencha com um CEP válido";
    }
    return null;
  }

  String? emailValidator(String? text) {
    if (text == null || text.isEmpty) {
      return "Este campo deve ser preenchido";
    }
    if (!text.contains("@")) {
      return "Preencha com um email válido";
    }
    return null;
  }

  String? passwordValidator(String? text) {
    if (text == null || text.isEmpty) {
      return "Este campo deve ser preenchido";
    }
    if (text.length < 6) {
      return "Sua senha deve ter pelo menos 6 dígitos";
    }
    return null;
  }

  String? confirmPasswordValidator({String? text, required String senha}) {
    if (text == null || text.isEmpty) {
      return "Este campo deve ser preenchido";
    }
    if (text.length < 6) {
      return "Sua senha deve ter pelo menos 6 dígitos";
    }
    if (text != senha) {
      return "As senhas estão diferentes";
    }
    return null;
  }
}
