import 'package:clean_arch_aula/modules/home/domain/usecases/buscar_endreco.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.freezed.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.buscarEndereco(
      {required BuscarEndrecoParams params}) = _$HomeEventBuscarEndereco;
}
