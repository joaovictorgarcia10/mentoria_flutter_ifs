import 'package:clean_arch_aula/modules/home/data/models/endereco_model.dart';
import 'package:clean_arch_aula/modules/home/domain/entities/endereco.dart';
import 'package:clean_arch_aula/shared/core/error/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.empty() = _$HomeStateEmpty;
  const factory HomeState.loading() = _$HomeStateLoading;
  const factory HomeState.failure({required Failure failure}) =
      _$HomeStateFailure;
  const factory HomeState.success({required EnderecoModel endereco}) =
      _$HomeStateSuccess;
}
