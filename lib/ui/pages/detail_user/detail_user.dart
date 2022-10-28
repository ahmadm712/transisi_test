// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_transisi/cubits/detail_user_cubit/detail_user_cubit.dart';

class DetailUserPage extends StatefulWidget {
  const DetailUserPage({
    Key? key,
    required this.userId,
  }) : super(key: key);
  final String userId;
  static const String routeName = '/detail-user';
  @override
  State<DetailUserPage> createState() => _DetailUserPageState();
}

class _DetailUserPageState extends State<DetailUserPage> {
  @override
  void initState() {
    super.initState();
    context.read<DetailUserCubit>().fetchDetailUser(id: widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    log(widget.userId);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Detail User'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: BlocConsumer<DetailUserCubit, DetailUserState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is DetailUserHasData) {
                final user = state.data;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            user.avatar!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      '${user.firstName} ${user.lastName}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Card(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: double.infinity,
                        height: 60,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.phone,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              user.id.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: double.infinity,
                        height: 60,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.email_outlined,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              user.email!,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
