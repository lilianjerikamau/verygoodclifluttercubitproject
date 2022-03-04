import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:very_good_project/models/failure_model.dart';
import 'package:very_good_project/repository/api_repository.dart';

import '../models/post_model.dart';

part 'post_fetch_state.dart';

class PostFetchCubit extends Cubit<PostFetchState> {
  final ApiRepository apiRepository;

  PostFetchCubit({
    required this.apiRepository,
  }) : super(PostFetchInitial());

  Future<void> fetchPostApi() async {
    emit(PostFetchLoading());
    try {
      final List<Post>? postList = await apiRepository.getPostList();
      emit(PostFetchLoaded(postList: postList ?? []));
    } on Failure catch (err) {
      emit(PostFetchError(failure: err));
    } catch (err) {
      print('Error:$err');
    }
  }
}
