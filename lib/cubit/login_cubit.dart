
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_cubit.freezed.dart';
part 'login_cubit.g.dart';

@freezed
class LoginCubit with _$LoginCubit {
  factory LoginCubit() = _LoginCubit;
	
  factory LoginCubit.fromJson(Map<String, dynamic> json) =>
			_$LoginCubitFromJson(json);
}
