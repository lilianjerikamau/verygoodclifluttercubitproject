library very_good_project;

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_project/cubit/post_fetch_cubit.dart';
import 'package:very_good_project/models/_index.dart';
import 'package:logger/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:very_good_project/app/view/home_page.dart';
import 'package:very_good_project/service/_index.dart';
import 'package:very_good_project/cubit/post_fetch_cubit.dart';

part 'constants.dart';
// part 'network.dart';
part 'very_good_routers.dart';
part 'singletons.dart';
