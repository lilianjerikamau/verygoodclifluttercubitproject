part of very_good_project;

// late final ApiRepository apiRepository;

class Singletons {
  // static late final ApiService apiService;
  static final apiService = ApiService();

  static List<BlocProvider> registerCubits() => [
        BlocProvider<PostFetchCubit>(
          create: (context) => PostFetchCubit(
            apiRepository: ApiRepository(
              apiService: apiService,
            ),
          ),
        ),
      ];
}
