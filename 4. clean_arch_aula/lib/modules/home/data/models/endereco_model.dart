import 'dart:convert';
import 'package:clean_arch_aula/modules/home/domain/entities/endereco.dart';

class EnderecoModel extends Endereco {
  EnderecoModel({
    String? cep,
    String? logradouro,
    String? complemento,
    String? bairro,
    String? localidade,
    String? uf,
    String? ibge,
    String? gia,
    String? ddd,
    String? siafi,
  }) : super(
            cep: cep,
            logradouro: logradouro,
            complemento: complemento,
            bairro: bairro,
            ddd: ddd,
            gia: gia,
            ibge: ibge,
            localidade: localidade,
            siafi: siafi);

  EnderecoModel copyWith({
    String? cep,
    String? logradouro,
    String? complemento,
    String? bairro,
    String? localidade,
    String? uf,
    String? ibge,
    String? gia,
    String? ddd,
    String? siafi,
  }) {
    return EnderecoModel(
      cep: cep ?? this.cep,
      logradouro: logradouro ?? this.logradouro,
      complemento: complemento ?? this.complemento,
      bairro: bairro ?? this.bairro,
      localidade: localidade ?? this.localidade,
      uf: uf ?? this.uf,
      ibge: ibge ?? this.ibge,
      gia: gia ?? this.gia,
      ddd: ddd ?? this.ddd,
      siafi: siafi ?? this.siafi,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (cep != null) {
      result.addAll({'cep': cep});
    }
    if (logradouro != null) {
      result.addAll({'logradouro': logradouro});
    }
    if (complemento != null) {
      result.addAll({'complemento': complemento});
    }
    if (bairro != null) {
      result.addAll({'bairro': bairro});
    }
    if (localidade != null) {
      result.addAll({'localidade': localidade});
    }
    if (uf != null) {
      result.addAll({'uf': uf});
    }
    if (ibge != null) {
      result.addAll({'ibge': ibge});
    }
    if (gia != null) {
      result.addAll({'gia': gia});
    }
    if (ddd != null) {
      result.addAll({'ddd': ddd});
    }
    if (siafi != null) {
      result.addAll({'siafi': siafi});
    }

    return result;
  }

  factory EnderecoModel.fromMap(Map<String, dynamic> map) {
    return EnderecoModel(
      cep: map['cep'],
      logradouro: map['logradouro'],
      complemento: map['complemento'],
      bairro: map['bairro'],
      localidade: map['localidade'],
      uf: map['uf'],
      ibge: map['ibge'],
      gia: map['gia'],
      ddd: map['ddd'],
      siafi: map['siafi'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EnderecoModel.fromJson(String source) =>
      EnderecoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EnderecoModel(cep: $cep, logradouro: $logradouro, complemento: $complemento, bairro: $bairro, localidade: $localidade, uf: $uf, ibge: $ibge, gia: $gia, ddd: $ddd, siafi: $siafi)';
  }
}
