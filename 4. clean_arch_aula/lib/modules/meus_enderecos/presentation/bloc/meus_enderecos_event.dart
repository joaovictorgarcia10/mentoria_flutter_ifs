import 'package:clean_arch_aula/modules/meus_enderecos/domain/usecases/delete_endereco.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meus_enderecos_event.freezed.dart';

@freezed
class MeusEnderecosEvent with _$MeusEnderecosEvent {
  const factory MeusEnderecosEvent.getListaEnderecos() =
      _$MeusEnderecosEventGetListaEnderecos;
  const factory MeusEnderecosEvent.deleteEndereco(
          {required DeleteEnderecoParams deleteEnderecoParams}) =
      _$MeusEnderecosEventDeleteListaEnderecos;
}
