class ContatoModel {
  String nomeCompleto;
  String cpf;
  String carro;
  String email;

  ContatoModel({this.carro, this.cpf, this.email, this.nomeCompleto});

  static ContatoModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ContatoModel(
        nomeCompleto: map['nome_completo'],
        cpf: map['cpf'],
        carro: map['carro'],
        email: map['email']);
  }
}
