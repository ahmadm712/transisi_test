import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_transisi/cubits/list_users_cubit/list_users_cubit.dart';
import 'package:test_transisi/data/models/list_user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<ListUsersCubit>().fetchUsers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ListUsersCubit, ListUsersState>(
        builder: (context, state) {
          if (state is ListUsersHasData ||
              state is ListUsersLoading && !state.isInitial) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              controller: _scrollController,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (index >= state.users.length) {
                  return state.hasReachedMaximum
                      ? const Center(
                          child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Has Reach Max'),
                        ))
                      : const Center(
                          child: CircularProgressIndicator(strokeWidth: 0.7),
                        );
                } else {
                  final user = state.users[index];
                  return UserCard(user: user);
                }
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: state.users.length + 1,
            );
          } else if (state is ListUsersFailed) {
            return Center(
              child: Text(state.error),
            );
          }
          return Container();
        },
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  final Users user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 120,
      child: ListTile(
        onTap: () {},
        leading: SizedBox(
          height: 50,
          width: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              user.avatar!,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text('${user.firstName} ${user.lastName}'),
        subtitle: Text(user.id.toString()),
      ),
    );
  }
}
