import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_project/cubit/post_fetch_cubit.dart';
import 'package:very_good_project/models/_index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();

    context.read<PostFetchCubit>().fetchPostApi();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('API FETCH WITH CUBIT'),
        ),
        body: BlocBuilder<PostFetchCubit, PostFetchState>(
          builder: (context, state) {
            if (state is PostFetchLoading) {
              return const CircularProgressIndicator();
            } else {
              if (state is PostFetchError) {
                return Text(state.failure.message);
              } else if (state is PostFetchLoaded) {
                final postList = state.postList;
                return postList.isEmpty
                    ? const Text('No Posts')
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        itemCount: postList.length,
                        itemBuilder: (context, index) {
                          final PostModelTrial singlePost = postList[index];

                          return ListTile(
                            leading: CircleAvatar(
                              child: Text(singlePost.id.toString()),
                            ),
                            title: Text(singlePost.title),
                            subtitle: Text(singlePost.body),
                          );
                        },
                      );
              }

              return const SizedBox.shrink();
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/weatherRoute');
          },
          backgroundColor: Colors.black,
          tooltip: 'Capture Picture',
          elevation: 5,
          splashColor: Colors.grey,
          child: const Icon(
            Icons.camera,
            color: Colors.white,
            size: 29,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
