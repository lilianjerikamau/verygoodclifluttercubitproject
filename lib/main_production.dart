// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_project/cubit/post_fetch_cubit.dart';

import 'package:very_good_project/service/api_repository.dart';
import 'package:very_good_project/screens/home_page.dart';
import 'package:very_good_project/service/api_service.dart';

import 'bootstrap.dart';

void main() {
  bootstrap(
    () => MyApp(
      apiService: ApiService(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.apiService}) : super(key: key);
  final ApiService apiService;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        (BlocProvider<PostFetchCubit>(
          create: (context) => PostFetchCubit(
            apiRepository: ApiRepository(
              apiService: apiService,
            ),
          )..fetchPostApi(),
        )),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
