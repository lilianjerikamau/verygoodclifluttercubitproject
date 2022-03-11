part of very_good_project;

// late final ApiRepository apiRepository;

class Singletons {
  static late final ApiService apiService;
  // final apiRepository = ApiRepository();

  static List<BlocProvider> registerCubits({required ApiService apiService}) =>
      [
        BlocProvider<PostFetchCubit>(
          create: (context) => PostFetchCubit(
            apiRepository: ApiRepository(
              apiService: apiService,
            ),
          )..fetchPostApi(),
        ),
      ];
}
