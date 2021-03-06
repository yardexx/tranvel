import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainvel/user/cubit/user_cubit.dart';
import 'package:trainvel/user/widgets/widgets.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final user = context.watch<UserCubit>().state.user;

    return InkWell(
      onTap: () => Navigator.of(context).push(UserPage.route()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, ${user.name}!',
                style: theme.textTheme.headline4?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                user.name == 'Unknown'
                    ? 'Tap here to create account.'
                    : "Hope, you're having a good day.",
                style: theme.textTheme.subtitle1,
              ),
            ],
          ),
          const CircleAvatar(
            radius: 32,
            foregroundImage: NetworkImage(
              'https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            ),
          ),
        ],
      ),
    );
  }
}
