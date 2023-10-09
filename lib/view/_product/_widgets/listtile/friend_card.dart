import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/core/extensions/context_extension.dart';
import 'package:flutter_architecture/view/_product/_constants/friends_constants.dart';
import 'package:kartal/kartal.dart';

import '../../../home/social/model/social_model.dart';

class FriendCard extends StatelessWidget {
  const FriendCard({Key? key, this.user, this.onPressed}) : super(key: key);
  final SocialUser? user;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    if (user == null) {
      // throw Exception('User object is null $this');
      return const SizedBox();
    }
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(user!.image!)),
      title: Text(user!.name!),
      onTap: onPressed,
      subtitle: Text(user!.company!),
      trailing: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: context.colors.background,
          foregroundColor: context.appTheme.buttonTheme.colorScheme?.onError,
        ),
        child: const Text(FriendsConstants.follow).tr(),
      ),
    );
  }
}