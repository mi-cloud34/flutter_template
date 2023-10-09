import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../../home/social/model/social_model.dart';
import '../../home/social/view/social_view_detail.dart';
class OpenContainerSocailWrapper extends StatelessWidget {
  const OpenContainerSocailWrapper({
    this.closedBuilder,
    this.onClosed,
    this.socialUser,
  });
  final ContainerTransitionType _transitionType = ContainerTransitionType.fade;

  final OpenContainerBuilder? closedBuilder;
  final ClosedCallback<bool?>? onClosed;
  final SocialUser? socialUser;
  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: _transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return SocialUserViewDetail(
          socialUser: socialUser,
        );
      },
      onClosed: onClosed,
      tappable: false,
      closedBuilder: closedBuilder as Widget Function(BuildContext, void Function()),
    );
  }
}