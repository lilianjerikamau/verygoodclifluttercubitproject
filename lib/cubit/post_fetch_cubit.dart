import 'package:equatable/equatable.dart';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:very_good_project/models/_index.dart';

import '../service/_index.dart';

part 'post_fetch_state.dart';

class PostFetchCubit extends Cubit<PostFetchState> {
  final ApiRepository apiRepository;

  PostFetchCubit({
    required this.apiRepository,
  }) : super(PostFetchInitial());

  Future<void> fetchPostApi() async {
    emit(PostFetchLoading());
    try {
      final List<PostModelTrial>? postList = await apiRepository.getPostList();
      emit(PostFetchLoaded(postList: postList ?? []));
    } on Failure catch (err) {
      emit(PostFetchError(failure: err));
    } catch (err) {
      print('Error:$err');
    }
  }
}
