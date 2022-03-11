// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures

// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_project/app/app.dart';
import 'package:very_good_project/bootstrap.dart';
import 'package:very_good_project/cubit/post_fetch_cubit.dart';
import 'package:very_good_project/cubit/weather_cubit.dart';
import 'package:very_good_project/models/_index.dart';
import 'package:very_good_project/screens/home_page.dart';
import 'package:very_good_project/service/weather_repository.dart';
import 'package:very_good_project/utils/_index.dart';

import 'package:very_good_project/service/_index.dart';

void main() {
  bootstrap(
    () => MultiBlocProvider(
      providers: Singletons.registerCubits(
        apiService: ApiService(),
      ),
      child: const HomePage(),
    ),
  );
}
